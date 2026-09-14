# Send this machine's Project Zomboid log to the development machine.
#
#   .\push_log.ps1
#
# Copy this file once to the play machine - anywhere, the Desktop is fine - and
# run it after a session. It does not need an elevated shell, and it does not
# need the OpenSSH *server*, which a company-managed Windows box may refuse to
# install. The OpenSSH client ships enabled by default and is all this uses.
#
# Quit the game first. PZ appends to console.txt continuously, so a log copied
# mid-session is truncated at whatever had been flushed.

param(
    [string]$DevHost = "elkin@192.168.50.226",
    [string]$DevPath = "/home/elkin/Conspiracy-Files/dev/playtest-logs/incoming",
    [string]$Zomboid = "$env:USERPROFILE\Zomboid",
    [switch]$All      # also send the timestamped Logs folder
)

$ErrorActionPreference = "Stop"

# $env:USERPROFILE is whichever account this shell runs as. Running from an
# elevated shell on another account (la_fricke rather than elkin.fricke) points
# it at a profile that has never played. So: use it when it actually holds a
# console.txt, otherwise pick whichever profile on this machine has the newest
# one, and say which was chosen rather than failing quietly.
function Resolve-ZomboidFolder {
    param([string]$Preferred)

    if (Test-Path (Join-Path $Preferred "console.txt")) { return $Preferred }

    # Dropped into the Zomboid folder itself, which is the tidiest place for it:
    # the log is right there, it is always the correct profile, and it does not
    # vanish when Downloads is cleared out.
    if ($PSScriptRoot -and (Test-Path (Join-Path $PSScriptRoot "console.txt"))) {
        Write-Host "using this script's own folder: $PSScriptRoot" -ForegroundColor Yellow
        return $PSScriptRoot
    }

    $candidates = Get-ChildItem "C:\Users" -Directory -ErrorAction SilentlyContinue |
        ForEach-Object { Join-Path $_.FullName "Zomboid" } |
        Where-Object { Test-Path (Join-Path $_ "console.txt") } |
        Sort-Object { (Get-Item (Join-Path $_ "console.txt")).LastWriteTime } -Descending

    if ($candidates) {
        Write-Host "No console.txt under $Preferred; using $($candidates[0])" -ForegroundColor Yellow
        return $candidates[0]
    }
    return $Preferred
}

$Zomboid = Resolve-ZomboidFolder $Zomboid

$console = Join-Path $Zomboid "console.txt"
if (-not (Test-Path $console)) {
    Write-Host "No console.txt at $console" -ForegroundColor Red
    Write-Host "If you play as a different Windows account, pass its folder:"
    Write-Host '  .\push_log.ps1 -Zomboid "C:\Users\someone\Zomboid"'
    exit 1
}

$age = [int]((Get-Date) - (Get-Item $console).LastWriteTime).TotalMinutes
$kb  = [int]((Get-Item $console).Length / 1KB)
Write-Host "console.txt: $kb KB, last written $age minute(s) ago"
if ($age -gt 120) {
    Write-Host "That is old. Did the session you want to report actually run?" -ForegroundColor Yellow
}

$stamp  = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$target = "${DevHost}:$DevPath/console-$stamp.txt"

Write-Host "sending to $target ..."
scp $console $target
if ($LASTEXITCODE -ne 0) {
    Write-Host "scp failed. Is the development machine on and reachable?" -ForegroundColor Red
    exit 1
}

if ($All) {
    $logs = Join-Path $Zomboid "Logs"
    if (Test-Path $logs) {
        Write-Host "sending Logs folder ..."
        scp -r $logs "${DevHost}:$DevPath/Logs-$stamp"
    }
}

Write-Host "sent. Tell Claude to read it." -ForegroundColor Green
