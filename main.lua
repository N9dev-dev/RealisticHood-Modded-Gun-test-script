local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/N9dev-dev/Aimbot-V2/main/Resources/Scripts/Raw%20Main.lua"))()

local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Players = false 
ESP.Tracers = false 
ESP.Boxes = false 
ESP.Names = false
getgenv().gunMod = false


local watermark = library:Watermark("Realistic Hood Script Made By Dev")

local main = library:Load{
    Name = "DevX",
    SizeX = 600,
    SizeY = 650,
    Theme = "Midnight",
    Extension = "json", -- config file extension
    Folder = "DevX" -- config folder name
}


local tabs = {
    maint = main:Tab("main")
}

local sections = {
    aims = tabs.maint:Section{Name = "Aimbot", Side = "Left"},
    fovs = tabs.maint:Section{Name = "Aimbot FOV", Side = "Right"},
    mains = tabs.maint:Section{Name = "Visuals", Side = "Left"},
    miscs = tabs.maint:Section{Name = "Misc", Side = "Right"}
}

--[Config]

local configs = main:Tab("Configuration")

local themes = configs:Section{Name = "Theme", Side = "Left"}

local themepickers = {}

local themelist = themes:Dropdown{
    Name = "Theme",
    Default = library.currenttheme,
    Content = library:GetThemes(),
    Flag = "Theme Dropdown",
    Callback = function(option)
        if option then
            library:SetTheme(option)

            for option, picker in next, themepickers do
                picker:Set(library.theme[option])
            end
        end
    end
}

library:ConfigIgnore("Theme Dropdown")

local namebox = themes:Box{
    Name = "Custom Theme Name",
    Placeholder = "Custom Theme",
    Flag = "Custom Theme"
}

library:ConfigIgnore("Custom Theme")

themes:Button{
    Name = "Save Custom Theme",
    Callback = function()
        if library:SaveCustomTheme(library.flags["Custom Theme"]) then
            themelist:Refresh(library:GetThemes())
            themelist:Set(library.flags["Custom Theme"])
            namebox:Set("")
        end
    end
}

local customtheme = configs:Section{Name = "Custom Theme", Side = "Right"}

themepickers["Accent"] = customtheme:ColorPicker{
    Name = "Accent",
    Default = library.theme["Accent"],
    Flag = "Accent",
    Callback = function(color)
        library:ChangeThemeOption("Accent", color)
    end
}

library:ConfigIgnore("Accent")

themepickers["Window Background"] = customtheme:ColorPicker{
    Name = "Window Background",
    Default = library.theme["Window Background"],
    Flag = "Window Background",
    Callback = function(color)
        library:ChangeThemeOption("Window Background", color)
    end
}

library:ConfigIgnore("Window Background")

themepickers["Window Border"] = customtheme:ColorPicker{
    Name = "Window Border",
    Default = library.theme["Window Border"],
    Flag = "Window Border",
    Callback = function(color)
        library:ChangeThemeOption("Window Border", color)
    end
}

library:ConfigIgnore("Window Border")

themepickers["Tab Background"] = customtheme:ColorPicker{
    Name = "Tab Background",
    Default = library.theme["Tab Background"],
    Flag = "Tab Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Background", color)
    end
}

library:ConfigIgnore("Tab Background")

themepickers["Tab Border"] = customtheme:ColorPicker{
    Name = "Tab Border",
    Default = library.theme["Tab Border"],
    Flag = "Tab Border",
    Callback = function(color)
        library:ChangeThemeOption("Tab Border", color)
    end
}

library:ConfigIgnore("Tab Border")

themepickers["Tab Toggle Background"] = customtheme:ColorPicker{
    Name = "Tab Toggle Background",
    Default = library.theme["Tab Toggle Background"],
    Flag = "Tab Toggle Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Toggle Background", color)
    end
}

library:ConfigIgnore("Tab Toggle Background")

themepickers["Section Background"] = customtheme:ColorPicker{
    Name = "Section Background",
    Default = library.theme["Section Background"],
    Flag = "Section Background",
    Callback = function(color)
        library:ChangeThemeOption("Section Background", color)
    end
}

library:ConfigIgnore("Section Background")

themepickers["Section Border"] = customtheme:ColorPicker{
    Name = "Section Border",
    Default = library.theme["Section Border"],
    Flag = "Section Border",
    Callback = function(color)
        library:ChangeThemeOption("Section Border", color)
    end
}

library:ConfigIgnore("Section Border")

themepickers["Text"] = customtheme:ColorPicker{
    Name = "Text",
    Default = library.theme["Text"],
    Flag = "Text",
    Callback = function(color)
        library:ChangeThemeOption("Text", color)
    end
}

library:ConfigIgnore("Text")

themepickers["Disabled Text"] = customtheme:ColorPicker{
    Name = "Disabled Text",
    Default = library.theme["Disabled Text"],
    Flag = "Disabled Text",
    Callback = function(color)
        library:ChangeThemeOption("Disabled Text", color)
    end
}

library:ConfigIgnore("Disabled Text")

themepickers["Object Background"] = customtheme:ColorPicker{
    Name = "Object Background",
    Default = library.theme["Object Background"],
    Flag = "Object Background",
    Callback = function(color)
        library:ChangeThemeOption("Object Background", color)
    end
}

library:ConfigIgnore("Object Background")

themepickers["Object Border"] = customtheme:ColorPicker{
    Name = "Object Border",
    Default = library.theme["Object Border"],
    Flag = "Object Border",
    Callback = function(color)
        library:ChangeThemeOption("Object Border", color)
    end
}

library:ConfigIgnore("Object Border")

themepickers["Dropdown Option Background"] = customtheme:ColorPicker{
    Name = "Dropdown Option Background",
    Default = library.theme["Dropdown Option Background"],
    Flag = "Dropdown Option Background",
    Callback = function(color)
        library:ChangeThemeOption("Dropdown Option Background", color)
    end
}

library:ConfigIgnore("Dropdown Option Background")

local configsection = configs:Section{Name = "Configs", Side = "Left"}

local configlist = configsection:Dropdown{
    Name = "Configs",
    Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
    Flag = "Config Dropdown"
}

library:ConfigIgnore("Config Dropdown")

local loadconfig = configsection:Button{
    Name = "Load Config",
    Callback = function()
        library:LoadConfig(library.flags["Config Dropdown"]) -- LoadConfig(library.flags["Config Dropdown"], true)  if you want universal configs
    end
}

local delconfig = configsection:Button{
    Name = "Delete Config",
    Callback = function()
        library:DeleteConfig(library.flags["Config Dropdown"]) -- DeleteConfig(library.flags["Config Dropdown"], true)  if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}


local configbox = configsection:Box{
    Name = "Config Name",
    Placeholder = "Config Name",
    Flag = "Config Name"
}

library:ConfigIgnore("Config Name")

local save = configsection:Button{
    Name = "Save Config",
    Callback = function()
        library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"], true) -- SaveConfig(library.flags["Config Name"], true) if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}

local keybindsection = configs:Section{Name = "UI Toggle Keybind", Side = "Left"}

keybindsection:Keybind{
    Name = "UI Toggle",
    Flag = "UI Toggle",
    Default = Enum.KeyCode.RightShift,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Callback = function(_, fromsetting)
        if not fromsetting then
            library:Close()
        end
    end
}

keybindsection:Keybind{
    Name = "UI Close",
    Flag = "UI Close",
    Default = Enum.UserInputType.MouseButton3,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2},
    Callback = function(_, fromsetting)
        if not fromsetting then
            library:Unload()
            ESP.Players = false 
            ESP.Tracers = false 
            ESP.Boxes = false 
            ESP.Names = false
            ESP.TeamColor = true
            ESP.FaceCamera = false
            ESP.AutoRemove = true
            getgenv().gunMod = false
            getgenv().Aimbot.Settings = {
                SendNotifications = false,
                SaveSettings = false, -- Re-execute upon changing
                ReloadOnTeleport = false,
                Enabled = false,
                TeamCheck = false,
                AliveCheck = false,
                WallCheck = false, -- Laggy
                Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
                ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
                ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
                TriggerKey = "MouseButton2",
                Toggle = false,
                LockPart = "Head" -- Body part to lock on (Character part's name)
            }
            
            getgenv().Aimbot.FOVSettings = {
                Enabled = false,
                Visible = false,
                Amount = 90,
                Color = "255, 255, 255",
                LockedColor = "255, 70, 70",
                Transparency = 0.5,
                Sides = 60,
                Thickness = 1,
                Filled = false
            }
        end
    end
}
-------------------------------------------------------

--[Visuals]

local toggle = sections.mains:Toggle{
    Name = "Players",
    Flag = "pla",
    --Default = true,
    Callback  = function(a)
        ESP.Players = a
    end
}

local toggle = sections.mains:Toggle{
    Name = "Boxes",
    Flag = "box",
    --Default = true,
    Callback  = function(a)
       ESP.Boxes = a 
    end
}

local toggle = sections.mains:Toggle{
    Name = "Tracers",
    Flag = "tra",
    --Default = true,
    Callback  = function(a)
        ESP.Tracers = a
    end
}

local toggle = sections.mains:Toggle{
    Name = "Names",
    Flag = "nam",
    --Default = true,
    Callback  = function(a)
        ESP.Names = a
    end
}

local colorpicker = sections.mains:ColorPicker{
    Name = "Color",
    Default = Color3.new(107, 128, 104),
    Flag = "col",
    Callback = function(color)
        ESP.Color = color
    end
}

local toggle = sections.mains:Toggle{
    Name = "Team Color",
    Flag = "teacol",
    --Default = true,
    Callback  = function(a)
        ESP.TeamColor = a
    end
}

local toggle = sections.mains:Toggle{
    Name = "Face Camera",
    Flag = "faccam",
    --Default = true,
    Callback  = function(a)
        ESP.FaceCamera = a
    end
}

local toggle = sections.mains:Toggle{
    Name = "Auto Remove",
    Flag = "autrem",
    --Default = true,
    Callback  = function(a)
        ESP.AutoRemove = a
    end
}
-----------------------------------------------------------------------------------------
--[Aimbot]



local toggle = sections.aims:Toggle{
    Name = "Enabled",
    Flag = "aime",
    --Default = true,
    Callback  = function(a)
        getgenv().Aimbot.Settings.Enabled = a
    end
}

local toggle = sections.aims:Toggle{
    Name = "Reload On TP",
    Flag = "aimrot",
    --Default = true,
    Callback  = function(a)
        getgenv().Aimbot.Settings.ReloadOnTP = a
    end
}

local toggle = sections.aims:Toggle{
    Name = "Team Check",
    Flag = "aimtc",
    --Default = true,
    Callback  = function(a)
        getgenv().Aimbot.Settings.TeamCheck = a
    end
}

local toggle = sections.aims:Toggle{
    Name = "Alive Check",
    Flag = "aimac",
    --Default = true,
    Callback  = function(a)
        getgenv().Aimbot.Settings.AliveCheck = a
    end
}

local toggle = sections.aims:Toggle{
    Name = "Wall Check",
    Flag = "aimwc",
    --Default = true,
    Callback  = function(a)
        getgenv().Aimbot.Settings.WallCheck = a
    end
}

local slider = sections.aims:Slider{
    Name = "Smoothness less = fast",
    Text = "[value]/3",
    Default = 0.1,
    Min = 0,
    Max = 3,
    Float = 0.01,
    Flag = "aimsm",
    Callback = function(a)
        getgenv().Aimbot.Settings.Sensitivity = a
    end
}

local toggle = sections.aims:Toggle{
    Name = "Third Person",
    Flag = "aimtp",
    --Default = true,
    Callback  = function(a)
        getgenv().Aimbot.Settings.ThirdPerson = a
    end
}

local slider = sections.aims:Slider{
    Name = "TP Smoothness less = slow",
    Text = "[value]/5",
    Default = 5,
    Min = 0.1,
    Max = 5,
    Float = 0.1,
    Flag = "aimtpsm",
    Callback = function(a)
        getgenv().Aimbot.Settings.ThridPersonSensitivity = a
    end
}

local keybind = sections.aims:Keybind{
    Name = "Trigger Key",
    Default = Enum.UserInputType.MouseButton2,
    Blacklist = { Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D },
    Flag = "Keybind 1",
    Callback = function(key, fromsetting)
        if fromsetting then 
            print("Keybind 1 is now " .. tostring(key))
        else
            print("Keybind 1 was pressed")
        end
    end
}

local toggle = sections.aims:Toggle{
    Name = "Toggle",
    Flag = "aimto",
    --Default = true,
    Callback  = function(a)
        getgenv().Aimbot.Settings.Toggle = a
    end
}

local dropdown = sections.aims:Dropdown{
    Name = "Lock Part",
    Default = "Head",
    Content = {
        "Head",
        "HumanoidRootPart",
        "UpperTorso",
        "LowerTorso",
        "LeftFoot",
        "RightFoot",
        "LeftHand",
        "RightHand",
        "LeftLowerArm",
        "LeftLowerLeg",
        "RightLowerArm",
        "RightLowerLeg",
        "LeftUpperArm",
        "LeftUpperLeg",
        "RightUpperArm",
        "RightUpperLeg",
    },
    Flag = "aimlp",
    Callback = function(option)
        getgenv().Aimbot.Settings.LockPart = tostring(option)
    end
}
---------------------------------------------------
--[FOVSettings]


local toggle = sections.fovs:Toggle{
    Name = "Enabled",
    Flag = "fove",
    --Default = true,
    Callback  = function(a)
        getgenv().Aimbot.FOVSettings.Enabled = a
    end
}

local toggle = sections.fovs:Toggle{
    Name = "Visible",
    Flag = "fovvs",
    --Default = true,
    Callback  = function(a)
        getgenv().Aimbot.FOVSettings.Visible = a
    end
}

local slider = sections.fovs:Slider{
    Name = "Size",
    Text = "[value]/300",
    Default = 90,
    Min = 1,
    Max = 300,
    Float = 1,
    Flag = "fovsiz",
    Callback = function(a)
        getgenv().Aimbot.FOVSettings.Amount = a
    end
}

local colorpicker = sections.fovs:ColorPicker{
    Name = "Color",
    Default = Color3.fromRGB(255, 255, 255),
    Flag = "fovco",
    Callback = function(color)
        getgenv().Aimbot.FOVSettings.Color =  color
    end
}

local colorpicker = sections.fovs:ColorPicker{
    Name = "Locked Color",
    Default = Color3.fromRGB(255, 70, 70),
    Flag = "fovco",
    Callback = function(color)
        getgenv().Aimbot.FOVSettings.LockedColor =  color
    end
}



local slider = sections.fovs:Slider{
    Name = "Transparency",
    Text = "[value]/1",
    Default = 1,
    Min = 0,
    Max = 1,
    Float = 0.01,
    Flag = "fovtran",
    Callback = function(a)
        getgenv().Aimbot.FOVSettings.Transparency = a
    end
}

local slider = sections.fovs:Slider{
    Name = "Sides",
    Text = "[value]/60",
    Default = 60,
    Min = 3,
    Max = 60,
    Float = 1,
    Flag = "fovsid",
    Callback = function(a)
        getgenv().Aimbot.FOVSettings.Sides = a
    end
}

local slider = sections.fovs:Slider{
    Name = "Thickness",
    Text = "[value]/50",
    Default = 1,
    Min = 0.1,
    Max = 50,
    Float = 0.1,
    Flag = "fovthi",
    Callback = function(a)
        getgenv().Aimbot.FOVSettings.Thickness = a
    end
}


local toggle = sections.fovs:Toggle{
    Name = "Filled",
    Flag = "fovfill",
    --Default = true,
    Callback  = function(a)
        getgenv().Aimbot.FOVSettings.Filled = a
    end
}

----------------------------------------------------------
--[Misc]
        local Noclip = nil
        local Clip = nil
        
        function noclip()
            Clip = false
            local function Nocl()
                if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
                            v.CanCollide = false
                        end
                    end
                end
                wait(0.21) -- basic optimization
            end
            Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
        end
        
        function clip()
            if Noclip then Noclip:Disconnect() end
            Clip = true
        end
    
        function recurse(instance)
            if instance:IsA("Tool") or instance:IsA("HopperBin") then
                print(instance:GetFullName())
                if workspace.FilteringEnabled == false then
                    c = instance:Clone()
                    c.Parent = game.Players.LocalPlayer.Backpack
               else
                    instance.Parent = game.Players.LocalPlayer.Backpack
               end
            end
            for _, child in ipairs(instance:GetChildren()) do
                recurse(child)
            end
        end

local label = sections.miscs:Label("Click the Gun Mod button")
local label = sections.miscs:Label("everytime you respawn")
local label = sections.miscs:Label("Features: No recoil/spreed")
local label = sections.miscs:Label(", Inf ammo, 3 Fire Modes")
local label = sections.miscs:Label("works in most but not all guns.")

sections.miscs:Button{
    Name = "Gun Mod",
    Callback  = function()
        do
            local Plr = game:GetService("Players").LocalPlayer
            for i,v in pairs(Plr.Backpack:GetChildren()) do
                Plr.Character.Humanoid:EquipTool(v)
                task.wait()
                Plr.Character.Humanoid:UnequipTools(v)
        
            end
        end
        
        for i,v in pairs(getgc(true)) do
            if type(v) == 'table' and rawget(v, 'Ammo') then
                v.Ammo = 9e9
                v.StoredAmmo = 9e9
                v.MaxStoredAmmo = 9e9
                v.gunRecoil = {
                    gunRecoilUp = {0,0},
                    gunRecoilTilt = {0,0},
                    gunRecoilLeft = {0,0},
                    gunRecoilRight = {0,0},
                }
                v.camRecoil = {
                    camRecoilUp = {0,0},
                    camRecoilTilt = {0,0},
                    camRecoilLeft = {0,0},
                    camRecoilRight = {0,0},
                }
                v.FireModes = {
                    ChangeFiremode = true,
                    Semi = true,
                    Burst = true,
                    Auto = true }
                v.MinSpread = 0
                v.MaxSpread = 0
                task.wait()
            end
        end
    end
}

sections.miscs:Button{
    Name = "Fullbright (click to toggle)",
    Callback  = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
    end
}


sections.miscs:Button{
    Name = "No Clip",
    Callback  = function()
        noclip()
    end
}

sections.miscs:Button{
    Name = "Clip",
    Callback  = function()
        clip()
    end
}

sections.miscs:Button{
    Name = "Get ALL guns that players have",
    Callback  = function()
        recurse(game)
    end
}

sections.miscs:Button{
    Name = "Ruin the game",
    Callback  = function()
                --// Target
        local target = game:GetService('Players').LocalPlayer -- localplayer as default

        --// CFrame
        local cFrame = CFrame.new(0,0,0)

        --// Size
        local Size = {
        X = 4000,
        Y = 4000,
        Z = 4000
        }

        --// Build
        for _,v in next, game.ReplicatedStorage:GetDescendants() do
        if v.Name == 'Breach' and v:IsA('RemoteFunction') then
            v:InvokeServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame=target.Character.HumanoidRootPart.CFrame*cFrame,Size=Size})
        end
        end
    end
}

sections.miscs:Button{
    Name = "Steal Dropped Cash",
    Callback  = function()
        for i,v in pairs(game:GetService("Workspace"):GetChildren())do
            if v.Name == "sCash" then
               wait(.1)
            v.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
            end
            end
    end
}

local box = sections.miscs:Box{
    Name = "Steal guns from player",
    Placeholder = "Player usernaem to steal from",
    Flag = "miscsggun",
    Callback = function(text)
        for _,v in ipairs(game.Players[text].Backpack:GetChildren()) do
            if v:IsA("Tool") or v:IsA("HopperBin") then
               v:Clone().Parent = game.Players.LocalPlayer.Backpack
            end
         end
    end
}






















































