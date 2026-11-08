local Library = loadstring(game:HttpGet(
    "https://script-blush-six.vercel.app/3e8042a7b012/zynix.lua"
))()

Library:SetTheme({
    Accent = Color3.fromRGB(88, 120, 255)
})

local Window = Library:CreateWindow({
    Title = "Zynix Example",
    Subtitle = "All Components",
    Width = 460,
    Height = 360,
    TabWidth = 120,
    ToggleKey = Enum.KeyCode.RightShift
})

-- Tab: Main
local Main = Window:CreateTab({ Name = "Main", Icon = "🏠" })

Main:CreateSection({ Name = "Text" })

Main:CreateLabel({ Text = "This is a label." })

local Paragraph = Main:CreateParagraph({
    Title = "Paragraph",
    Content = "This is a paragraph with a longer description."
})

Paragraph:SetContent("Paragraph content updated.")

Main:CreateLine()

Main:CreateSection({ Name = "Actions" })

Main:CreateButton({
    Name = "Print to Console",
    Callback = function()
        print("Button clicked.")
    end
})

Main:CreateButton({
    Name = "Show Success Notification",
    Callback = function()
        Library:Notify({
            Title = "Success",
            Description = "Action completed.",
            Type = "Success",
            Duration = 3
        })
    end
})

Main:CreateButton({
    Name = "Show Error Notification",
    Callback = function()
        Library:Notify({
            Title = "Error",
            Description = "Something went wrong.",
            Type = "Error",
            Duration = 3
        })
    end
})

Main:CreateButton({
    Name = "Show Warning Notification",
    Callback = function()
        Library:Notify({
            Title = "Warning",
            Description = "Be careful.",
            Type = "Warning",
            Duration = 3
        })
    end
})

Main:CreateButton({
    Name = "Show Info Notification",
    Callback = function()
        Library:Notify({
            Title = "Info",
            Description = "Just so you know.",
            Type = "Info",
            Duration = 3
        })
    end
})

-- Tab: Controls
local Controls = Window:CreateTab({ Name = "Controls", Icon = "🎛️" })

Controls:CreateSection({ Name = "Toggle" })

local Toggle = Controls:CreateToggle({
    Name = "Example Toggle",
    Description = "Enable or disable a setting",
    Default = false,
    Flag = "example_toggle",
    Callback = function(Value)
        print("Toggle:", Value)
    end
})

Controls:CreateButton({
    Name = "Force Toggle On",
    Callback = function()
        Toggle:Set(true)
    end
})

Controls:CreateSection({ Name = "Slider" })

local Slider = Controls:CreateSlider({
    Name = "Example Slider",
    Min = 0,
    Max = 100,
    Increment = 1,
    Default = 50,
    Flag = "example_slider",
    Callback = function(Value)
        print("Slider:", Value)
    end
})

Controls:CreateButton({
    Name = "Set Slider to 75",
    Callback = function()
        Slider:Set(75)
    end
})

Controls:CreateSection({ Name = "Input" })

local Input = Controls:CreateInput({
    Name = "Text Input",
    Placeholder = "Type something...",
    Default = "",
    Flag = "example_input",
    Callback = function(Value)
        print("Input:", Value)
    end
})

Controls:CreateInput({
    Name = "Numeric Input",
    Placeholder = "0",
    Default = "10",
    Numeric = true,
    Min = 1,
    Max = 100,
    Callback = function(Value)
        print("Numeric:", Value)
    end
})

Controls:CreateButton({
    Name = "Set Text Input",
    Callback = function()
        Input:Set("Hello")
    end
})

-- Tab: Selections
local Selections = Window:CreateTab({ Name = "Selections", Icon = "📋" })

Selections:CreateSection({ Name = "Dropdown" })

local Dropdown = Selections:CreateDropdown({
    Name = "Mode",
    Options = { "Easy", "Normal", "Hard" },
    Default = "Easy",
    Flag = "example_mode",
    Callback = function(Value)
        print("Dropdown:", Value)
    end
})

Selections:CreateButton({
    Name = "Set Dropdown to Hard",
    Callback = function()
        Dropdown:Set("Hard")
    end
})

Selections:CreateButton({
    Name = "Replace Dropdown Options",
    Callback = function()
        Dropdown:SetOptions({ "Option A", "Option B", "Option C" })
    end
})

Selections:CreateSection({ Name = "Multi Dropdown" })

local Multi = Selections:CreateMultiDropdown({
    Name = "Features",
    Options = { "Feature A", "Feature B", "Feature C" },
    Default = { "Feature A" },
    Flag = "example_features",
    Callback = function(Values)
        print("Selected:", table.concat(Values, ", "))
    end
})

Selections:CreateButton({
    Name = "Select All Features",
    Callback = function()
        Multi:SelectAll()
    end
})

Selections:CreateButton({
    Name = "Clear Features",
    Callback = function()
        Multi:Clear()
    end
})

Selections:CreateSection({ Name = "Multi Instance Dropdown" })

local PlayerList = Selections:CreateMultiInstanceDropdown({
    Name = "Select Players",
    Source = game:GetService("Players"),
    ClassName = "Player",
    IncludeSelf = false,
    Callback = function(Selected)
        print("Selected players:", #Selected)
    end
})

Selections:CreateButton({
    Name = "Refresh Player List",
    Callback = function()
        PlayerList:Refresh()
    end
})

-- Tab: Keybinds
local Keybinds = Window:CreateTab({ Name = "Keybinds", Icon = "⌨️" })

Keybinds:CreateSection({ Name = "Binds" })

Keybinds:CreateKeybind({
    Name = "Example Keybind",
    Default = Enum.KeyCode.G,
    Flag = "example_keybind",
    Callback = function()
        Library:Notify({
            Title = "Keybind",
            Description = "G was pressed.",
            Type = "Info"
        })
    end
})

Keybinds:CreateKeybind({
    Name = "Second Keybind",
    Default = Enum.KeyCode.H,
    Callback = function()
        print("H pressed.")
    end
})

Keybinds:CreateSection({ Name = "Flags" })

Keybinds:CreateButton({
    Name = "Print All Flags",
    Callback = function()
        for Name, Value in pairs(Library.Flags) do
            print(Name, Value)
        end
    end
})

Keybinds:CreateButton({
    Name = "Clear All Flags",
    Callback = function()
        Library.Flags = {}
        Library:Notify({
            Title = "Flags",
            Description = "All flags cleared.",
            Type = "Warning"
        })
    end
})

-- Tab: Window
local WindowTab = Window:CreateTab({ Name = "Window", Icon = "🪟" })

WindowTab:CreateSection({ Name = "Window Controls" })

WindowTab:CreateButton({
    Name = "Hide Window",
    Callback = function()
        Window:SetVisible(false)
        task.delay(2, function()
            Window:SetVisible(true)
        end)
    end
})

WindowTab:CreateButton({
    Name = "Destroy Window",
    Callback = function()
        Window:Destroy()
    end
})

WindowTab:CreateSection({ Name = "Key System" })

WindowTab:CreateButton({
    Name = "Open Key System",
    Callback = function()
        Library:CreateKeySystem({
            Title = "Access Verification",
            BottomLabel = "Enter your key (demo: test123)",
            Key = "test123",
            Link = "https://example.com",
            OnSuccess = function()
                Library:Notify({
                    Title = "Key Accepted",
                    Description = "Access granted.",
                    Type = "Success"
                })
            end
        })
    end
})

Library:Notify({
    Title = "Zynix UI",
    Description = "Example loaded. Press RightShift to toggle.",
    Type = "Success",
    Duration = 4
})
