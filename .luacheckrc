std = "lua51"
max_line_length = false

files["test"] = {
    globals = {
        "TEST_ROOT", "TEST_SEPARATOR", "TEST_REQUIRED_MODULES",
        "test", "assertTrue", "assertFalse", "assertEqual", "assertDeepEqual"
    }
}

files["mod/common/media/lua/client"] = {
    globals = {
        "ConspiracyFiles", "Events", "ModData", "getPlayer", "getWorld",
        "getActivatedMods", "isClient", "isServer"
    }
}

files["mod/common/media/lua/shared/ConspiracyFiles/Runtime.lua"] = {
    globals = {
        "ConspiracyFiles", "Events", "ModData", "ZombRand", "getCell",
        "getPlayer", "getSaveDir", "isClient"
    }
}

exclude_files = {
    "dev/**/*.lua"
}
