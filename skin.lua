-- raw.githubusercontent.com/User/Repo/main/MyPlugin.lua
do
    -------------------------------------------------
    -- 1. SERVICES
    -------------------------------------------------
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer

    -------------------------------------------------
    -- 2. LẤY TAB (hub có sẵn) hoặc tự tạo
    -------------------------------------------------
    local Tab = _G.PhiPhai and _G.PhiPhai.Tabs and (
        _G.PhiPhai.Tabs.Plugins
        or _G.PhiPhai.Tabs.Utility
        or _G.PhiPhai.Tabs.Main
    )

    if not Tab then
        warn("[MyPlugin] Chạy hub PhiPhai trước (cần Tabs)")
        return
    end

    local function Notify(title, content, dur)
        if _G.PhiPhai and _G.PhiPhai.Notify then
            pcall(_G.PhiPhai.Notify, title, content, dur or 2)
        end
    end

    -------------------------------------------------
    -- 3. LOGIC / STATE
    -------------------------------------------------
    local State = {
        enabled = false,
    }

    local function doSomething()
        -- logic thật
    end

    -------------------------------------------------
    -- 4. UI OBSIDIAN
    -------------------------------------------------
    local Box = Tab:AddGroupbox({ Side = "Left", Name = "My Plugin" })

    Box:AddToggle("MyPlugin_Enable", {
        Text = "Enable Feature",
        Default = false,
        Callback = function(v)
            State.enabled = v
            if v then
                doSomething()
                Notify("MyPlugin", "ON", 2)
            else
                Notify("MyPlugin", "OFF", 1)
            end
        end,
    })

    -------------------------------------------------
    -- 5. EXPORT (optional)
    -------------------------------------------------
    _G.PhiPhai = _G.PhiPhai or {}
    _G.PhiPhai.MyPlugin = State

    print("[MyPlugin] Loaded")
end
