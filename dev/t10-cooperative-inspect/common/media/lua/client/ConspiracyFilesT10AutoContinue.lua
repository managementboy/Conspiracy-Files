-- Disposable T10 harness: traverse the raw-input-only main menu in automation.
-- This file deliberately has no access to item setup, context-menu callbacks,
-- domain mutations, or assertion reporting.

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T10AutoContinue = ConspiracyFiles.T10AutoContinue or {
    ticks = 0,
    dispatched = false,
}

local Harness = ConspiracyFiles.T10AutoContinue

local function removeSelf()
    Events.OnTick.Remove(Harness.onTick)
end

function Harness.onTick()
    if Harness.dispatched then
        removeSelf()
        return
    end

    Harness.ticks = Harness.ticks + 1
    if Harness.ticks < 180 then return end
    if not MainScreen or not MainScreen.instance then return end
    if not MainScreen.latestSaveGameMode or not MainScreen.latestSaveWorld then return end
    if MainScreen.instance.delay and MainScreen.instance.delay > 0 then return end

    Harness.dispatched = true
    removeSelf()
    print("[CF-T10-HARNESS]|AUTO_CONTINUE|scope=main-menu-navigation-only")
    MainScreen.continueLatestSave(MainScreen.latestSaveGameMode, MainScreen.latestSaveWorld)
end

Events.OnTick.Remove(Harness.onTick)
Events.OnTick.Add(Harness.onTick)
