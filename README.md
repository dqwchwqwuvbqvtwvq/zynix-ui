# Zynix UI

A lightweight and customizable Roblox UI library written in Lua.

Zynix UI provides a simple interface-building API with windows, tabs, interactive components, notifications, and theme customization.

## Installation

```lua
local Library = loadstring(game:HttpGet(
    "https://script-blush-six.vercel.app/3e8042a7b012/zynix.lua"
))()
```

## Quick Start

```lua
local Library = loadstring(game:HttpGet(
    "https://script-blush-six.vercel.app/3e8042a7b012/zynix.lua"
))()

local Window = Library:CreateWindow({
    Title = "Zynix UI",
    Subtitle = "Made with Zynix",
    Width = 440,
    Height = 320,
    TabWidth = 120,
    ToggleKey = Enum.KeyCode.RightShift
})

local Main = Window:CreateTab({
    Name = "Main",
    Icon = "🏠"
})

Main:CreateSection({
    Name = "General"
})

Main:CreateLabel({
    Text = "Welcome to Zynix UI!"
})

Main:CreateButton({
    Name = "Show Notification",
    Callback = function()
        Library:Notify({
            Title = "Zynix UI",
            Description = "The button was clicked.",
            Type = "Success"
        })
    end
})
```

## Components

### Window

Creates the main interface window.

```lua
local Window = Library:CreateWindow({
    Title = "My Hub",
    Subtitle = "Powered by Zynix",
    Width = 440,
    Height = 320,
    TabWidth = 120,
    ToggleKey = Enum.KeyCode.RightShift
})
```

### Tab

Creates a tab inside the window.

```lua
local Main = Window:CreateTab({
    Name = "Main",
    Icon = "🏠"
})
```

### Section

Adds a heading to organize components.

```lua
Main:CreateSection({
    Name = "General Settings"
})
```

### Line

Adds a visual separator.

```lua
Main:CreateLine()
```

### Label

Displays a short text label.

```lua
local Label = Main:CreateLabel({
    Text = "Welcome!"
})

Label:Set("Settings loaded!")
```

### Paragraph

Displays a title and a longer description.

```lua
local Paragraph = Main:CreateParagraph({
    Title = "Information",
    Content = "This is an example description."
})

Paragraph:SetContent("The description has been updated.")
```

### Button

Creates a clickable button.

```lua
Main:CreateButton({
    Name = "Click Me",
    Callback = function()
        print("Button clicked!")
    end
})
```

**Use case:** Run an action when the user clicks the button.

### Toggle

Creates an on/off switch.

```lua
local Toggle = Main:CreateToggle({
    Name = "Example Toggle",
    Description = "Enable or disable a setting",
    Default = false,
    Flag = "ExampleToggle",

    Callback = function(Value)
        print("Enabled:", Value)
    end
})

print(Toggle:Get())
Toggle:Set(true)
```

**Use case:** Enable or disable a feature.

### Slider

Creates a control for selecting a numeric value.

```lua
local Slider = Main:CreateSlider({
    Name = "Volume",
    Min = 0,
    Max = 100,
    Default = 50,
    Increment = 1,

    Callback = function(Value)
        print("Volume:", Value)
    end
})
```

**Use case:** Adjust values such as volume, sensitivity, or UI scale.

### Input

Creates a text input field.

```lua
local Input = Main:CreateInput({
    Name = "Username",
    Placeholder = "Enter a username...",

    Callback = function(Value)
        print("Input:", Value)
    end
})

print(Input:Get())
Input:Set("Jova")
```

A numeric input can be configured with numeric options:

```lua
Main:CreateInput({
    Name = "Amount",
    Default = "10",
    Numeric = true,
    Min = 1,
    Max = 100,

    Callback = function(Value)
        print("Amount:", Value)
    end
})
```

### Dropdown

Lets the user select one option.

```lua
local Dropdown = Main:CreateDropdown({
    Name = "Select Mode",
    Options = {
        "Easy",
        "Normal",
        "Hard"
    },
    Default = "Easy",

    Callback = function(Value)
        print("Selected:", Value)
    end
})

print(Dropdown:Get())
Dropdown:Set("Hard")

Dropdown:SetOptions({
    "Option A",
    "Option B",
    "Option C"
})
```

**Use case:** Choose one mode, category, or preset.

### MultiDropdown

Lets the user select multiple options.

```lua
local Multi = Main:CreateMultiDropdown({
    Name = "Select Features",
    Options = {
        "Feature A",
        "Feature B",
        "Feature C"
    },
    Default = {"Feature A"},

    Callback = function(Values)
        for _, Value in ipairs(Values) do
            print(Value)
        end
    end
})

print(Multi:Get())
Multi:SelectAll()
Multi:Clear()
```

**Use case:** Enable several independent options at once.

### MultiInstanceDropdown

Provides a multi-selection list of Roblox Instances.

```lua
local Players = game:GetService("Players")

local PlayerList = Main:CreateMultiInstanceDropdown({
    Name = "Select Players",
    Source = Players,
    ClassName = "Player",
    IncludeSelf = false,

    Callback = function(Selected)
        print("Selected instances:", #Selected)
    end
})
```

The source can be used to populate the list with matching Instances. Check the library implementation for the exact filtering and refresh options supported by your version.

### Keybind

Creates a keyboard shortcut.

```lua
Main:CreateKeybind({
    Name = "Example Keybind",
    Default = Enum.KeyCode.G,

    Callback = function()
        print("Keybind pressed!")
    end
})
```

**Use case:** Trigger a UI action using a keyboard shortcut.

## Notifications

Displays a temporary notification.

```lua
Library:Notify({
    Title = "Zynix UI",
    Description = "Your settings have been saved.",
    Type = "Success",
    Duration = 3
})
```

Common notification types include:

- `Info`
- `Success`
- `Warning`
- `Error`

## Themes

Customize the UI colors and fonts with `SetTheme`.

```lua
Library:SetTheme({
    Background = Color3.fromRGB(15, 15, 20),
    Surface = Color3.fromRGB(25, 25, 32),
    SurfaceHi = Color3.fromRGB(35, 35, 45),
    Accent = Color3.fromRGB(80, 120, 255),
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(150, 150, 160)
})
```

Theme properties available in the library include:

| Property | Purpose |
|---|---|
| `Background` | Main window background |
| `Surface` | Component background |
| `SurfaceHi` | Highlighted or hover surface |
| `Off` | Disabled toggle color |
| `Stroke` | Border color |
| `Accent` | Primary accent color |
| `Text` | Main text color |
| `SubText` | Secondary text color |
| `Success` | Success status color |
| `Warning` | Warning status color |
| `Error` | Error status color |
| `Font` | Regular font |
| `FontBold` | Bold font |
| `TweenTime` | Default animation duration |

## Key System

Creates a key-entry interface.

```lua
Library:CreateKeySystem({
    Title = "Access Verification",
    BottomLabel = "Enter your access key",
    Key = "YOUR_KEY",
    Link = "https://example.com",

    OnSuccess = function()
        print("Key accepted!")
    end
})
```

> **Security note:** A key checked locally by a client-side script is not secure authentication. Do not use client-side key checks to protect sensitive server-side resources.

## Window Methods

```lua
-- Hide the window
Window:SetVisible(false)

-- Show the window
Window:SetVisible(true)

-- Destroy the window
Window:Destroy()
```

## Example: Multi-Tab Interface

```lua
local Library = loadstring(game:HttpGet(
    "https://script-blush-six.vercel.app/3e8042a7b012/zynix.lua"
))()

local Window = Library:CreateWindow({
    Title = "Jova Hub",
    Subtitle = "Powered by Zynix",
    Width = 440,
    Height = 320
})

local Home = Window:CreateTab({
    Name = "Home",
    Icon = "🏠"
})

Home:CreateSection({
    Name = "Welcome"
})

Home:CreateParagraph({
    Title = "Jova Hub",
    Content = "Welcome to the hub. Choose a setting below."
})

local Settings = Window:CreateTab({
    Name = "Settings",
    Icon = "⚙️"
})

Settings:CreateToggle({
    Name = "Example Setting",
    Default = false,
    Callback = function(Value)
        print("Setting enabled:", Value)
    end
})

Settings:CreateSlider({
    Name = "Example Value",
    Min = 1,
    Max = 100,
    Default = 50,
    Callback = function(Value)
        print("Value:", Value)
    end
})
```

## Notes

- The library is designed for Roblox Lua environments that support the APIs used by the source.
- Some interactions may behave differently between desktop and touch devices.
- Use the exact method names and option fields supported by the version you load.
- Review the source before using or redistributing it.

## Credits

**Zynix UI** — Lightweight, simple, and customizable.
