---@diagnostic disable: undefined-global, duplicate-index, undefined-field, deprecated

local finity = {}
finity.gs = {}

local finityObject = {}
local self2 = finityObject
local self = finity

local getasset = getsynasset or getcustomasset -- stolen from: github.com/7GrandDadPGN/VapeV4ForRoblox tehe

local Version = "1.0.2"
local Discord = loadstring(game:HttpGet("https://raw.githubusercontent.com/LocalSmail/Finity/main/discord"))()
local debug = false -- Set to true to enable debugging.

if writefile then
elseif not writefile then
	print("Your executor does not support the writefile() function. We do not support your injector.")
end

local Asset_Names = {
	"Arrow.png",
	"CheatBackground.png",
	"CheatBoxStuff.png",
	"CheatList.png",
	"CheatSliderbar.png",
	"CheatVisiFrame.png",
	"DropDown.png",
	"NotifSound.wav",
	"HSVBar.png",
	"lumienceimage.png",
	"InfoNotification.png",
	"NotificationBar.png",
	"ScrollBar.png",
	"Success.png",
	"WarningNotification.png",
	"WindowBlur.png"
}

finity.themes = {

	["Dark"] = {

		main_container = Color3.fromRGB(32, 32, 33),
		separator_color = Color3.fromRGB(63, 63, 65),

		text_color = Color3.fromRGB(206, 206, 206),

		category_button_background = Color3.fromRGB(63, 62, 65),
		category_button_border = Color3.fromRGB(72, 71, 74),

		checkbox_checked = Color3.fromRGB(132, 255, 130),
		checkbox_outer = Color3.fromRGB(84, 81, 86),
		checkbox_inner = Color3.fromRGB(132, 132, 136),

		slider_color = Color3.fromRGB(177, 177, 177),
		slider_color_sliding = Color3.fromRGB(132, 255, 130),
		slider_background = Color3.fromRGB(88, 84, 90),
		slider_text = Color3.fromRGB(177, 177, 177),

		textbox_background = Color3.fromRGB(103, 103, 106),
		textbox_background_hover = Color3.fromRGB(137, 137, 141),
		textbox_text = Color3.fromRGB(195, 195, 195),
		textbox_text_hover = Color3.fromRGB(232, 232, 232),
		textbox_placeholder = Color3.fromRGB(135, 135, 138),

		dropdown_background = Color3.fromRGB(88, 88, 91),
		dropdown_text = Color3.fromRGB(195, 195, 195),
		dropdown_text_hover = Color3.fromRGB(232, 232, 232),
		dropdown_scrollbar_color = Color3.fromRGB(118, 118, 121),
		dropdown_scrollbar_thickness = 4,

		button_background = Color3.fromRGB(103, 103, 106),
		button_background_hover = Color3.fromRGB(137, 137, 141),
		button_background_down = Color3.fromRGB(70, 70, 81),

		scrollbar_color = Color3.fromRGB(118, 118, 121),

		notification_warn = Color3.fromRGB(236, 129, 44),
		notification_success = Color3.fromRGB(139, 217, 45),
		notification_info = Color3.fromRGB(206, 206, 206),

		NotifSound = "MoonriseUI/assets/NotifSound.wav",

	},

	["Light"] = {

		main_container = Color3.fromRGB(249, 249, 255),
		separator_color = Color3.fromRGB(223, 219, 228),

		text_color = Color3.fromRGB(96, 96, 96),

		category_button_background = Color3.fromRGB(223, 219, 228),
		category_button_border = Color3.fromRGB(200, 196, 204),

		checkbox_checked = Color3.fromRGB(114, 214, 112),
		checkbox_outer = Color3.fromRGB(198, 189, 202),
		checkbox_inner = Color3.fromRGB(249, 239, 255),

		slider_color = Color3.fromRGB(114, 214, 112),
		slider_color_sliding = Color3.fromRGB(114, 214, 112),
		slider_background = Color3.fromRGB(198, 188, 202),
		slider_text = Color3.fromRGB(112, 112, 112),

		textbox_background = Color3.fromRGB(198, 189, 202),
		textbox_background_hover = Color3.fromRGB(215, 206, 227),
		textbox_text = Color3.fromRGB(112, 112, 112),
		textbox_text_hover = Color3.fromRGB(50, 50, 50),
		textbox_placeholder = Color3.fromRGB(178, 178, 178),

		dropdown_background = Color3.fromRGB(198, 189, 202),
		dropdown_text = Color3.fromRGB(112, 112, 112),
		dropdown_text_hover = Color3.fromRGB(50, 50, 50),
		dropdown_scrollbar_color = Color3.fromRGB(198, 189, 202),
		dropdown_scrollbar_thickness = 4,

		button_background = Color3.fromRGB(198, 189, 202),
		button_background_hover = Color3.fromRGB(215, 206, 227),
		button_background_down = Color3.fromRGB(178, 169, 182),

		scrollbar_color = Color3.fromRGB(198, 189, 202),

		notification_warn = Color3.fromRGB(236, 129, 44),
		notification_success = Color3.fromRGB(139, 217, 45),
		notification_info = Color3.fromRGB(206, 206, 206),

		NotifSound = "MoonriseUI/assets/NotifSound.wav",

	}
}

-- Here we will make the folders needed by finity which will store data/assets.
local DFAA = function()
	makefolder('MoonriseUI')
	makefolder('MoonriseUI/assets')
	makefolder('MoonriseUI/assets/custom') -- stores third part assets

	-- a template for the support that is to come

	if isfile('MoonriseUI/Customthemes.lua') then
		if debug then
			print('CustomThemes file exists.')
		end
	elseif not isfile('MoonriseUI/Customthemes.lua') then
		writefile('MoonriseUI/Customthemes.lua', game:HttpGet("https://raw.githubusercontent.com/LocalSmail/Finity/main/CustomThemeTemplate.lua"))
	end

	for i, v in Asset_Names do
		writefile('MoonriseUI/assets/'..v, game:HttpGet("https://raw.githubusercontent.com/Baseplate-LUA/MoonriseUILib/main/assets/"..v))
	end

end

if not isfolder('MoonriseUI') then
	print('Creating MoonriseUI folders in workspace.')
	DFAA()
end

function finity:DownloadCustomAsset(link: string, AssetName: string, IsCustomThemeFile: boolean)
	print("Downloading custom asset from: "..link)

	if not IsCustomThemeFile then
		writefile('MoonriseUI/assets/custom/'..AssetName, game:HttpGet(link))

	elseif IsCustomThemeFile and AssetName == nil or AssetName == "" or AssetName == " " then
		print("Downloading custom Customtheme.lua file")
		writefile('MoonriseUI/Customthemes.lua', game:HttpGet(link))

		-- Same as the function above just checks if the AssetName has a value just incase a random shitty error gets thrown
	elseif IsCustomThemeFile and not AssetName == nil or not AssetName == "" or not AssetName == " " then
		print("Downloading custom Customtheme.lua file.")
		warn("Tip: You dont have to put anything inside the AssetName argument, We parse the file name by default!")
		writefile('MoonriseUI/Customthemes.lua', game:HttpGet(link))

	end
end

-- Gets the asset parsed
local GetAssetFunc = function(path: string)
		--[[if not isfile(path) then -- Not working, needs fixing. On todo
			print('Could not find specified asset. Re-downloading resources, If it is a custom asset from a third party then use the DownloadCustomAsset() function.')
			DFAA()
		end]]

	return getasset(path)
end

local theme = finity.themes.Dark -- defaults to dark

-- Pretty much just sets the table to `game:GetService`
setmetatable(finity.gs, {
	__index = function(_, service)
		return game:GetService(service)
	end,

	__newindex = function(t, i)
		t[i] = nil
		return
	end
})

function finity:ImportCustomThemes(Theme_Name)
	local CustomthemeScript = loadfile("MoonriseUI/Customthemes.lua")()

	local themes = CustomthemeScript.CustomThemes

	for Theme_Name, Theme_Data in pairs(themes) do
		finity.themes[Theme_Name] = Theme_Data
	end

	if debug then
		for i, v in pairs(finity.themes) do
			print(i, v)
		end
	end
end

local suc, err = pcall(function()

	if game.Loaded then

		print([[

			_____ ___ _   _ ___ _______   __
			|  ___|_ _| \ | |_ _|_   _\ \ / /
			| |_   | ||  \| || |  | |  \ V /
			|  _|  | || |\  || |  | |   | |
			|_|   |___|_| \_|___| |_|   |_|

		]])

		print("You are using Finity version "..Version)
		print("")
		print("If you want Help, Found a Bug with the GUI, Have a suggestion or Just enjoy Finity, Join our Discord Community: "..Discord.." :D")

		local mouse = finity.gs["Players"].LocalPlayer:GetMouse()

		function finity:Create(class, properties)
			local object = Instance.new(class)

			for prop, val in next, properties do
				if object[prop] and prop ~= "Parent" then
					object[prop] = val
				end
			end

			return object
		end

		function finity:RedownloadAssets()
			if finity.gs["CoreGui"]:FindFirstChild("Finity") then
				finity.gs["CoreGui"]:FindFirstChild("Finity"):Destroy()
				DFAA()
				if debug then
					warn("Reinstalling Assets, Please wait. Destroying Finity to prevent issues.")
				end
                finity.gs["CoreGui"]:FindFirstChild("Finity"):Destroy() -- lazy way of preventing dupelicates of the gui from appearing
			end

			DFAA()
			warn("Please wait while we re-download finity's assets again. Doing anything else could corrupt assets or cause undesired behaviour.")
		end

		function self2.setTitle(text: string)
			self2.title.Text = text
		end

		function finity:addShadow(object, transparency)

			local shadow = self:Create('ImageLabel', {
				Name = "Shadow",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.5, 4),
				Size = UDim2.new(1, 6, 1, 6),
				Image = GetAssetFunc("MoonriseUI/assets/WindowBlur.png"),
				ImageTransparency = transparency and true or 0.5,
				ImageColor3 = Color3.fromRGB(35, 35, 35),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(10, 10, 118, 118)
			})
			
			if transparency > 1 then
				shadow.ImageTransparency = 0.5
			end

			shadow.Parent = object
		end

		function finity.playSound(Sound_Path: string)
				if finity.gs["CoreGui"]:FindFirstChild("Finity") and finity.gs["CoreGui"]:FindFirstChild("Finity")["Sound"] then

					local sound = finity.gs["CoreGui"]:FindFirstChild("Finity")["Sound"]

					sound.SoundId = GetAssetFunc(Sound_Path)
					sound.TimePosition = 0

					sound:Play()

				elseif not finity.gs["CoreGui"]:FindFirstChild("Finity")["Sound"] then

					local s = Instance.new("Sound")

					s.Name = "Sound"
					s.SoundId = GetAssetFunc(Sound_Path)
					s.Volume = 1
					s.Looped = false
					s.archivable = true
					s.TimePosition = 0

					s.Parent = game.Workspace.CurrentCamera

					s:Play()
			end
		end

		function finity.new(Title, IsDark, CustomTheme, CustomThemeName, HideToolTip, ToolTipText)

			for theme_names, junk in pairs(finity.themes) do
				if not CustomThemeName == theme_names then
					error("Theme name: "..CustomThemeName.."Doesn't exist.", 5)
				end
			end

			if finity.gs["CoreGui"]:FindFirstChild("Finity") then
				if debug then
					warn("Finity already exists, Destorying old GUI to prevent duplicates.")
				end
                finity.gs["CoreGui"]:FindFirstChild("Finity"):Destroy() -- lazy way of preventing dupelicates of the gui from appearing
			end

			-- You could use these two but i personally dont find much use with these, up to you!
			local gprojectName = false
			local thinProject = false

			local toggled = true
			local typing = false
			local firstCategory = true
			local savedposition = UDim2.new(0.5, 0, 0.5, 0) -- default pos will probably add onto this later.

			if IsDark == true and CustomTheme == true then
				theme = finity.themes[CustomThemeName]
			elseif IsDark == false and CustomTheme == true then
				theme = finity.themes[CustomThemeName]
			elseif IsDark == false and CustomTheme == false then
				theme = finity.themes.Light
			elseif IsDark == true and CustomTheme == false then
				theme = finity.themes.Dark
			end

			local finityData = {
				UpConnection = nil,
				ToggleKey = Enum.KeyCode.Home,
			}

			self2.ChangeToggleKey = function(NewKey)
				finityData.ToggleKey = "Enum.Keycode."..NewKey

				if finityData.UpConnection then
					finityData.UpConnection:Disconnect()
				end

				finityData.UpConnection = finity.gs["UserInputService"].InputEnded:Connect(function(Input)
					if Input.KeyCode == finityData.ToggleKey and not typing then

						toggled = not toggled

						self2.modal.Modal = toggled

						if toggled then

							self2.Container.Active = true -- uncommented

							pcall(self2.container.TweenPosition, self2.container, savedposition, "Out", "Sine", 0.5, true)
						else
							savedposition = self2.container.Position;
							pcall(self2.container.TweenPosition, self2.container, UDim2.new(savedposition.Width.Scale, savedposition.Width.Offset, 1.5, 0), "Out", "Sine", 0.5, true)
						end
					end
				end)
			end

			function self2:ChangeBackgroundImage(ImageID, Transparency)
				self2.container.Image = "rbxassetid://"..ImageID

				if Transparency then
					self2.container.ImageTransparency = Transparency
				elseif Transparency == nil or Transparency == "" or Transparency == " " then
					self2.container.ImageTransparency = 0
				elseif Transparency == 0.8 then -- If the value isnt defined or the same then
					self2.container.ImageTransparency = 0.8 -- set to 0.8
				elseif Transparency > 1 then
					warn("You're trying to set the transparency over the Max amount, Setting to 1. Please try setting it to values from 0 - 1")
					self2.container.ImageTransparency = 1
				end
			end

			finityData.UpConnection = finity.gs["UserInputService"].InputEnded:Connect(function(Input)
				if Input.KeyCode == finityData.ToggleKey and not typing then
					toggled = not toggled

					if toggled then
						self2.container:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), "Out", "Sine", 0.5, true)
					else
						self2.container:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), "Out", "Sine", 0.5, true)
					end
				end
			end)

			self2.userinterface = self:Create("ScreenGui", {
				Name = "Finity",
				ZIndexBehavior = Enum.ZIndexBehavior.Global,
				ResetOnSpawn = false,
				Parent = finity.gs["CoreGui"]
			})

			self2.container = self:Create("ImageLabel", {
				Draggable = true,
				Active = true,
				Name = "Container",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 0,
				BackgroundColor3 = theme.main_container,
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 800, 0, 500),
				ZIndex = 2,
				ImageTransparency = 1
			})

			self2.modal = self:Create("TextButton", {
				Text = "text";
				Transparency = 1;
				Modal = true;
			})

			self2.container.Draggable = true
			self2.container.Active = true

			self2.modal.Parent = self2.userinterface; -- Sets the parent of the button

			if thinProject and typeof(thinProject) == "UDim2" then
				self2.container.Size = thinProject
			end

			self2.sidebar = self:Create("Frame", {
				Name = "Sidebar",
				BackgroundColor3 = Color3.new(0.976471, 0.937255, 1),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(0.745098, 0.713726, 0.760784),
				Size = UDim2.new(0, 120, 1, -30),
				Position = UDim2.new(0, 0, 0, 30),
				ZIndex = 2,
			})

			self2.categories = self:Create("Frame", {
				Name = "Categories",
				BackgroundColor3 = Color3.new(0.976471, 0.937255, 1),
				ClipsDescendants = true,
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(0.745098, 0.713726, 0.760784),
				Size = UDim2.new(1, -120, 1, -30),
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 30),
				ZIndex = 2,
			})
			self2.categories.ClipsDescendants = true

			self2.topbar = self:Create("Frame", {
				Name = "Topbar",
				ZIndex = 2,
				Size = UDim2.new(1,0,0,30),
				BackgroundTransparency = 2
			})

			self2.title = self:Create("TextLabel", {
				Name = "Title",
				ZIndex = 2,
				Size = UDim2.new(1, -30, 0, 30),
				Position = UDim2.new(0, 30, 0, 0),
				--Text = 'Press ',".. string.sub(tostring(self.ToggleKey), 14) ..",' to hide this menu', -- defaults
				Font = Enum.Font.GothamSemibold,
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				TextColor3 = theme.text_color,
			})

			local separator = self:Create("Frame", {
				Name = "Separator",
				BackgroundColor3 = theme.separator_color,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 118, 0, 30),
				Size = UDim2.new(0, 1, 1, -30),
				ZIndex = 6,
			})
			separator.Parent = self2.container
			separator = nil

			local separator = self:Create("Frame", {
				Name = "Separator",
				BackgroundColor3 = theme.separator_color,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 30),
				Size = UDim2.new(1, 0, 0, 1),
				ZIndex = 6,
			})
			separator.Parent = self2.container
			separator = nil

			local uipagelayout = self:Create("UIPageLayout", {
				Padding = UDim.new(0, 10),
				FillDirection = Enum.FillDirection.Vertical,
				TweenTime = 0.7,
				EasingStyle = Enum.EasingStyle.Quad,
				EasingDirection = Enum.EasingDirection.InOut,
				SortOrder = Enum.SortOrder.LayoutOrder,
			})
			uipagelayout.Parent = self2.categories
			uipagelayout = nil

			local uipadding = self:Create("UIPadding", {
				PaddingTop = UDim.new(0, 3),
				PaddingLeft = UDim.new(0, 2)
			})
			uipadding.Parent = self2.sidebar
			uipadding = nil

			local uilistlayout = self:Create("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder
			})
			uilistlayout.Parent = self2.sidebar
			uilistlayout = nil

			function self2:ToastMessage(TopText: string, BottomText: string, Duration: number, Alert_Type: string, CustomBackgroundIcon: string)
		
				local notificationwindow = Instance.new("Frame")
				notificationwindow.BackgroundTransparency = 1
				notificationwindow.Active = false
				notificationwindow.Parent = self2.userinterface
				notificationwindow.Size = UDim2.new(1, 0, 1, 0)
				notificationwindow.Name = "NotifWindow"
		
				notificationwindow.ChildRemoved:Connect(function()
					for i,v in pairs(notificationwindow:GetChildren()) do
						finity.bettertween(v, UDim2.new(1, v.Position.X.Offset, 1, -(150 + 80 * (i - 1))), Enum.EasingDirection.In, Enum.EasingStyle.Sine, Duration, true)
					end
				end)
		
				local offset = #notificationwindow:GetChildren()
		
				local container = Instance.new("Frame")
				container.Size = UDim2.new(0, 266, 0, 75)
				container.Position = UDim2.new(1, 0, 1, -(150 + 80 * offset))
				container.BackgroundTransparency = 0
				container.BackgroundColor3 = theme.main_container
				container.BorderSizePixel = 0
				container.Parent = notificationwindow
				container.Visible = true
				container.ClipsDescendants = false
				container.Name = "container"
		
				local backgroundImg = Instance.new("ImageLabel")
				backgroundImg.SliceCenter = Rect.new(67, 59, 323, 120)
				backgroundImg.Position = UDim2.new(0, -61, 0, -50)
				backgroundImg.BackgroundTransparency = 1
				backgroundImg.Name = "backgroundImg"
				backgroundImg.ScaleType = Enum.ScaleType.Slice
				backgroundImg.Size = UDim2.new(1, 61, 0, 159)
				backgroundImg.Parent = container
		
				if not CustomBackgroundIcon == nil or not CustomBackgroundIcon == "" or not CustomBackgroundIcon == " " then
		
					local backgroundImg = Instance.new("ImageLabel")
					backgroundImg.SliceCenter = Rect.new(67, 59, 323, 120)
					backgroundImg.Position = UDim2.new(0, -61, 0, -50)
					backgroundImg.BackgroundTransparency = 1
					backgroundImg.Name = "backgroundImg"
					backgroundImg.ScaleType = Enum.ScaleType.Slice
					backgroundImg.Image = GetAssetFunc(CustomBackgroundIcon)
					backgroundImg.Size = UDim2.new(1, 61, 0, 159)
					backgroundImg.Parent = container
				end
		
				local uicorner = Instance.new("UICorner")
				uicorner.CornerRadius = UDim.new(0, 6)
				uicorner.Parent = container
		
				local frame2 = Instance.new("ImageLabel")
				frame2.BackgroundColor3 = theme.main_container
				frame2.Name = "Timer"
				frame2.BackgroundTransparency = 0
				frame2.SliceCenter = Rect.new(2, 0, 224, 2)
				frame2.Size = UDim2.new(1, 0, 0, 2)
				frame2.ScaleType = Enum.ScaleType.Slice
				frame2.Position = UDim2.new(0, 3, 1, -3)
				frame2.ZIndex = 2
				frame2.Active = true
				frame2.Image = GetAssetFunc("MoonriseUI/assets/NotificationBar.png")
				frame2.BorderSizePixel = 0
				frame2.Parent = container
		
				--[[frame2:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
					frame2.ImageColor3 = frame2.BackgroundColor3
				end)]]
		
				if Alert_Type == "Warning" then
		
					local icon = Instance.new("ImageLabel")
					icon.Name = "AlertIcon"
					icon.Image = GetAssetFunc('MoonriseUI/assets/WarningNotification.png')
					icon.BackgroundTransparency = 1
					icon.BorderSizePixel = 0
					icon.Position = UDim2.new(0, -17, 0, -6)
					icon.Size = UDim2.new(0, 90, 0, 90)
					icon.Parent = container
		
				elseif Alert_Type == "Info" then
		
					local icon = Instance.new("ImageLabel")
					icon.Name = "AlertIcon"
					icon.Image = GetAssetFunc('MoonriseUI/assets/InfoNotification.png')
					icon.BackgroundTransparency = 1
					icon.BorderSizePixel = 0
					icon.Position = UDim2.new(0, -17, 0, -6)
					icon.Size = UDim2.new(0, 90, 0, 90)
					icon.Parent = container
		
				elseif Alert_Type == "Success" then
		
					local icon = Instance.new("ImageLabel")
					icon.Name = "AlertIcon"
					icon.Image = GetAssetFunc('MoonriseUI/assets/Success.png')
					icon.BackgroundTransparency = 1
					icon.BorderSizePixel = 0
					icon.Position = UDim2.new(0, 7, 0, 14) -- the image is much bigger than others idk why
					icon.Size = UDim2.new(0, 40, 0, 40)
					icon.Parent = container
		
				end
		
				if Alert_Type == "Info" then
		
					local Title = Instance.new("TextLabel")
					Title.Font = Enum.Font.Gotham
					Title.TextSize = 13
					Title.RichText = true
					Title.TextTransparency = 0
					Title.TextColor3 = theme.notification_info
					Title.BackgroundTransparency = 1
					Title.Position = UDim2.new(0, 56, 0, 18)
					Title.TextXAlignment = Enum.TextXAlignment.Left
					Title.TextYAlignment = Enum.TextYAlignment.Top
					Title.Text = "<b>"..TopText.."</b>"
					Title.Parent = container
		
					local Content = Title:Clone()
					Content.Position = UDim2.new(0, 56, 0, 44)
					Content.Font = Enum.Font.Gotham
					Content.TextTransparency = 0
					Content.RichText = true
					Content.TextColor3 = theme.notification_info
					Content.Text = "<b>"..BottomText.."</b>"
					Content.Parent = container
		
				elseif Alert_Type == "Warning" then
		
					local Title = Instance.new("TextLabel")
					Title.Font = Enum.Font.Gotham
					Title.TextSize = 13
					Title.RichText = true
					Title.TextTransparency = 0
					Title.TextColor3 = theme.notification_warn
					Title.BackgroundTransparency = 1
					Title.Position = UDim2.new(0, 56, 0, 18)
					Title.TextXAlignment = Enum.TextXAlignment.Left
					Title.TextYAlignment = Enum.TextYAlignment.Top
					Title.Text = "<b>"..TopText.."</b>"
					Title.Parent = container
		
					local Content = Title:Clone()
					Content.Position = UDim2.new(0, 56, 0, 44)
					Content.Font = Enum.Font.Gotham
					Content.TextTransparency = 0
					Content.RichText = true
					Content.TextColor3 = theme.notification_info
					Content.Text = "<b>"..BottomText.."</b>"
					Content.Parent = container
		
				elseif Alert_Type == "Success" then
		
					local Title = Instance.new("TextLabel")
					Title.Font = Enum.Font.Gotham
					Title.TextSize = 13
					Title.RichText = true
					Title.TextTransparency = 0
					Title.TextColor3 = theme.notification_success
					Title.BackgroundTransparency = 1
					Title.Position = UDim2.new(0, 56, 0, 18)
					Title.TextXAlignment = Enum.TextXAlignment.Left
					Title.TextYAlignment = Enum.TextYAlignment.Top
					Title.Text = "<b>"..TopText.."</b>"
					Title.Parent = container
		
					local Content = Title:Clone()
					Content.Position = UDim2.new(0, 56, 0, 44)
					Content.Font = Enum.Font.Gotham
					Content.TextTransparency = 0
					Content.RichText = true
					Content.TextColor3 = theme.notification_info
					Content.Text = "<b>"..BottomText.."</b>"
					Content.Parent = container
		
				end
		
				container.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						task.spawn(function()
							pcall(function()
								finity.bettertween2(container, UDim2.new(1, -262, 1, -(150 + 80 * offset)), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15, true)
								task.wait(0.15)
								finity.bettertween2(container, UDim2.new(1, 0, 1, container.Position.Y.Offset), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15, true)
								task.wait(0.15)
								container:Destroy()
							end)
						end)
					end
				end)
		
				task.spawn(function()
					pcall(function()
						finity.bettertween2(container, UDim2.new(1, -262, 1, -(150 + 80 * offset)), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15, true)
						task.wait(0.15)
						frame2:TweenSize(UDim2.new(0, 0, 0, 2), Enum.EasingDirection.In, Enum.EasingStyle.Linear, Duration, true)
						task.wait(Duration)
						finity.bettertween2(container, UDim2.new(1, 0, 1, container.Position.Y.Offset), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15, true)
						task.wait(0.15)
						container:Destroy()
					end)
				end)
				return container
			end
		


			function self2:Category(name)
				local category = {}

				category.button = finity:Create("TextButton", {
					Name = name,
					BackgroundColor3 = theme.category_button_background,
					BackgroundTransparency = 1,
					BorderMode = Enum.BorderMode.Inset,
					BorderColor3 = theme.category_button_border,
					Size = UDim2.new(1, -4, 0, 25),
					ZIndex = 2,
					AutoButtonColor = false,
					Font = Enum.Font.GothamSemibold,
					Text = name,
					TextColor3 = theme.text_color,
					TextSize = 14
				})

				category.container = finity:Create("ScrollingFrame", {
					Name = name,
					BackgroundTransparency = 1,
					ScrollBarThickness = 4,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 2,
					CanvasSize = UDim2.new(0, 0, 0, 0),
					ScrollBarImageColor3 = theme.scrollbar_color or Color3.fromRGB(118, 118, 121),
					BottomImage = GetAssetFunc("MoonriseUI/assets/ScrollBar.png"),
					MidImage = GetAssetFunc("MoonriseUI/assets/ScrollBar.png"),
					TopImage = GetAssetFunc("MoonriseUI/assets/ScrollBar.png"),
					ScrollBarImageTransparency = 1 --
				})

				category.hider = finity:Create("Frame", {
					Name = "Hider",
					BackgroundTransparency = 0, --
					BorderSizePixel = 0,
					BackgroundColor3 = theme.main_container,
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 5
				})

				category.L = finity:Create("Frame", {
					Name = "L",
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 10, 0, 3),
					Size = UDim2.new(0.5, -20, 1, -3),
					ZIndex = 2
				})

				if not thinProject then
					category.R = finity:Create("Frame", {
						Name = "R",
						AnchorPoint = Vector2.new(1, 0),
						BackgroundColor3 = Color3.new(1, 1, 1),
						BackgroundTransparency = 1,
						Position = UDim2.new(1, -10, 0, 3),
						Size = UDim2.new(0.5, -20, 1, -3),
						ZIndex = 2
					})
				end

				if thinProject then
					category.L.Size = UDim2.new(1, -20, 1, -3)
				end

				if firstCategory then
					finity.gs["TweenService"]:Create(category.hider, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
					finity.gs["TweenService"]:Create(category.container, TweenInfo.new(0.3), {ScrollBarImageTransparency = 0}):Play()
				end

				do
					local uilistlayout = finity:Create("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder
					})

					local uilistlayout2 = finity:Create("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder
					})

					local function computeSizeChange()
						local largestListSize = 0

						largestListSize = uilistlayout.AbsoluteContentSize.Y

						if uilistlayout2.AbsoluteContentSize.Y > largestListSize then
							largestListSize = largestListSize
						end

						category.container.CanvasSize = UDim2.new(0, 0, 0, largestListSize + 5)
					end

					uilistlayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(computeSizeChange)
					uilistlayout2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(computeSizeChange)

					uilistlayout.Parent = category.L
					uilistlayout2.Parent = category.R
				end

				category.button.MouseEnter:Connect(function()
					finity.gs["TweenService"]:Create(category.button, TweenInfo.new(0.2), {BackgroundTransparency = 0.5}):Play()
				end)
				category.button.MouseLeave:Connect(function()
					finity.gs["TweenService"]:Create(category.button, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
				end)
				category.button.MouseButton1Down:Connect(function()
					for _, categoryf in next, self2.userinterface["Container"]["Categories"]:GetChildren() do
						if categoryf:IsA("ScrollingFrame") then
							if categoryf ~= category.container then
								finity.gs["TweenService"]:Create(categoryf.Hider, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
								finity.gs["TweenService"]:Create(categoryf, TweenInfo.new(0.3), {ScrollBarImageTransparency = 1}):Play()
							end
						end
					end

					finity.gs["TweenService"]:Create(category.button, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
					finity.gs["TweenService"]:Create(category.hider, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
					finity.gs["TweenService"]:Create(category.container, TweenInfo.new(0.3), {ScrollBarImageTransparency = 0}):Play()

					self2.categories["UIPageLayout"]:JumpTo(category.container)
				end)
				category.button.MouseButton1Up:Connect(function()
					finity.gs["TweenService"]:Create(category.button, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
				end)

				category.container.Parent = self2.categories
				category.button.Parent = self2.sidebar

				if not thinProject then
					category.R.Parent = category.container
				end

				category.L.Parent = category.container
				category.hider.Parent = category.container

				local function calculateSector()
					if thinProject then
						return "L"
					end

					local R = #category.R:GetChildren() - 1
					local L = #category.L:GetChildren() - 1

					if L > R then
						return "R"
					else
						return "L"
					end
				end

				function category:Sector(name)
					local sector = {}

					sector.frame = finity:Create("Frame", {
						Name = name,
						BackgroundColor3 = Color3.new(1, 1, 1),
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 25),
						ZIndex = 2
					})

					sector.container = finity:Create("Frame", {
						Name = "Container",
						BackgroundColor3 = Color3.new(1, 1, 1),
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 0, 0, 22),
						Size = UDim2.new(1, -5, 1, -30),
						ZIndex = 2
					})

					sector.title = finity:Create("TextLabel", {
						Name = "Title",
						Text = name,
						BackgroundColor3 = Color3.new(1, 1, 1),
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -5, 0, 25),
						ZIndex = 2,
						Font = Enum.Font.GothamSemibold,
						TextColor3 = theme.text_color,
						TextSize = 14,
						TextXAlignment = Enum.TextXAlignment.Left,
					})

					local uilistlayout = finity:Create("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder
					})

					uilistlayout.Changed:Connect(function()
						pcall(function()
							sector.frame.Size = UDim2.new(1, 0, 0, sector.container["UIListLayout"].AbsoluteContentSize.Y + 25)
							sector.container.Size = UDim2.new(1, 0, 0, sector.container["UIListLayout"].AbsoluteContentSize.Y)
						end)
					end)

					uilistlayout.Parent = sector.container
					uilistlayout = nil

					--[[
						kind - The kind of cheat you want to create
						name - Name you gave to the cheat
						callback - Data returend by the cheat
						data - data and shit (You'll understand it more if you read the code)
					]]
					function sector:Cheat(kind, name, callback, data)
						local cheat = {}
						cheat.value = nil

						cheat.frame = finity:Create("Frame", {
							Name = name,
							BackgroundColor3 = Color3.new(1, 1, 1),
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 25),
							ZIndex = 2,
						})

						cheat.label = finity:Create("TextLabel", {
							Name = "Title",
							BackgroundColor3 = Color3.new(1, 1, 1),
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 1, 0),
							ZIndex = 2,
							Font = Enum.Font.Gotham,
							TextColor3 = theme.text_color,
							TextSize = 13,
							Text = name,
							TextXAlignment = Enum.TextXAlignment.Left
						})

						cheat.container	= finity:Create("Frame", {
							Name = "Container",
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.new(1, 1, 1),
							BackgroundTransparency = 1,
							Position = UDim2.new(1, 0, 0.5, 0),
							Size = UDim2.new(0, 150, 0, 22),
							ZIndex = 2,
						})

						if kind then
							if string.lower(kind) == "checkbox" or string.lower(kind) == "toggle" or string.lower(kind) == "Checkbox" or string.lower(kind) == "Toggle" then
								if data then
									if data.enabled then
										cheat.value = true
									end
								end

								cheat.checkbox = finity:Create("Frame", {
									Name = "Checkbox",
									AnchorPoint = Vector2.new(1, 0),
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Position = UDim2.new(1, 0, 0, 0),
									Size = UDim2.new(0, 25, 0, 25),
									ZIndex = 2,
								})

								cheat.outerbox = finity:Create("ImageLabel", {
									Name = "Outer",
									AnchorPoint = Vector2.new(1, 0.5),
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Position = UDim2.new(1, 0, 0.5, 0),
									Size = UDim2.new(0, 20, 0, 20),
									ZIndex = 2,
									Image = GetAssetFunc("MoonriseUI/assets/CheatBackground.png"),
									ImageColor3 = theme.checkbox_outer,
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.06,
								})

								cheat.checkboxbutton = finity:Create("ImageButton", {
									AnchorPoint = Vector2.new(0.5, 0.5),
									Name = "CheckboxButton",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Position = UDim2.new(0.5, 0, 0.5, 0),
									Size = UDim2.new(0, 14, 0, 14),
									ZIndex = 2,
									Image = GetAssetFunc("MoonriseUI/assets/CheatBoxStuff.png"),
									ImageColor3 = theme.checkbox_inner,
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.04
								})

								-- button toggle and hover shit

								if data then
									if data.enabled then
										finity.gs["TweenService"]:Create(cheat.outerbox, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_checked}):Play()
										finity.gs["TweenService"]:Create(cheat.checkboxbutton, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_checked}):Play()
									end
								end

								cheat.checkboxbutton.MouseEnter:Connect(function()
									local lightertheme = Color3.fromRGB((theme.checkbox_outer.R * 255) + 20, (theme.checkbox_outer.G * 255) + 20, (theme.checkbox_outer.B * 255) + 20)
									finity.gs["TweenService"]:Create(cheat.outerbox, TweenInfo.new(0.2), {ImageColor3 = lightertheme}):Play()
								end)

								cheat.checkboxbutton.MouseLeave:Connect(function()
									if not cheat.value then
										finity.gs["TweenService"]:Create(cheat.outerbox, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_outer}):Play()
									else
										finity.gs["TweenService"]:Create(cheat.outerbox, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_checked}):Play()
									end
								end)

								cheat.checkboxbutton.MouseButton1Down:Connect(function()
									if cheat.value then
										finity.gs["TweenService"]:Create(cheat.checkboxbutton, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_outer}):Play()
									else
										finity.gs["TweenService"]:Create(cheat.checkboxbutton, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_checked}):Play()
									end
								end)

								cheat.checkboxbutton.MouseButton1Up:Connect(function()
									cheat.value = not cheat.value

									if callback then
										local s, e = pcall(function()
											callback(cheat.value)
										end)

										if not s then warn("error: ".. e) end
									end

									if cheat.value then
										finity.gs["TweenService"]:Create(cheat.outerbox, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_checked}):Play()
									else
										finity.gs["TweenService"]:Create(cheat.outerbox, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_outer}):Play()
										finity.gs["TweenService"]:Create(cheat.checkboxbutton, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_inner}):Play()
									end
								end)

								cheat.checkboxbutton.Parent = cheat.outerbox
								cheat.outerbox.Parent = cheat.container
							elseif string.lower(kind) == "color" or string.lower(kind) == "colorpicker" or string.lower(kind) == "Color" or string.lower(kind) == "Colorpicker" or string.lower(kind) == "Colour" or string.lower(kind) == "Colourpicker" or string.lower(kind) == "colourpicker" or string.lower(kind) ==  "colour" then
								cheat.value = Color3.new(1, 1, 1);

								if data then
									if data.color then
										cheat.value = data.color
									end
								end

								local hsvimage = GetAssetFunc("MoonriseUI/assets/HSVBar.png")
								local lumienceimage = GetAssetFunc("MoonriseUI/assets/lumienceimage.png")

								cheat.hsvbar = finity:Create("ImageButton", {
									AnchorPoint = Vector2.new(0.5, 0.5),
									Name = "HSVBar",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Position = UDim2.new(0.5, 0, 0.5, 0),
									Size = UDim2.new(1, 0, 0, 6),
									ZIndex = 2,
									Image = hsvimage
								})

								cheat.arrowpreview = finity:Create("ImageLabel", {
									Name = "ArrowPreview",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									ImageTransparency = 0.25,
									Position = UDim2.new(0.5, 0, 0.5, -6),
									Size = UDim2.new(0, 6, 0, 6),
									ZIndex = 3,
									Image = GetAssetFunc("MoonriseUI/assets/Arrow.png"),
									Rotation = -90
								})

								-- Math and shit
								-- Figure it out I ion gon explain dis fr

								cheat.hsvbar.MouseButton1Down:Connect(function()
									local rs = finity.gs["RunService"]
									local uis = finity.gs["UserInputService"]local last = cheat.value;

									cheat.hsvbar.Image = hsvimage

									while uis:IsMouseButtonPressed'MouseButton1' do
										local mouseloc = uis:GetMouseLocation()
										local sx = cheat.arrowpreview.AbsoluteSize.X / 2;
										local offset = (mouseloc.x - cheat.hsvbar.AbsolutePosition.X) - sx
										local scale = offset / cheat.hsvbar.AbsoluteSize.X
										local position = math.clamp(offset, -sx, cheat.hsvbar.AbsoluteSize.X - sx) / cheat.hsvbar.AbsoluteSize.X

										finity.gs["TweenService"]:Create(cheat.arrowpreview, TweenInfo.new(0.1), {Position = UDim2.new(position, 0, 0.5, -6)}):Play()

										cheat.value = Color3.fromHSV(math.clamp(scale, 0, 1), 1, 1)

										if cheat.value ~= last then
											last = cheat.value

											if callback then
												local s, e = pcall(function()
													callback(cheat.value)
												end)

												if not s then warn("error: ".. e) end
											end
										end

										rs.RenderStepped:wait()
									end
								end)
								
								cheat.hsvbar.MouseButton2Down:Connect(function()
									local rs = finity.gs["RunService"]
									local uis = finity.gs["UserInputService"]
									local last = cheat.value;

									cheat.hsvbar.Image = lumienceimage

									while uis:IsMouseButtonPressed'MouseButton2' do
										local mouseloc = uis:GetMouseLocation()
										local sx = cheat.arrowpreview.AbsoluteSize.X / 2
										local offset = (mouseloc.x - cheat.hsvbar.AbsolutePosition.X) - sx
										local scale = offset / cheat.hsvbar.AbsoluteSize.X
										local position = math.clamp(offset, -sx, cheat.hsvbar.AbsoluteSize.X - sx) / cheat.hsvbar.AbsoluteSize.X

										finity.gs["TweenService"]:Create(cheat.arrowpreview, TweenInfo.new(0.1), {Position = UDim2.new(position, 0, 0.5, -6)}):Play()

										cheat.value = Color3.fromHSV(1, 0, 1 - math.clamp(scale, 0, 1))

										if cheat.value ~= last then
											last = cheat.value

											if callback then
												local s, e = pcall(function()
													callback(cheat.value)
												end)

												if not s then warn("error: ".. e) end
											end
										end

										rs.RenderStepped:wait()
									end
								end)

								function cheat:SetValue(value)
									cheat.value = value
									if cheat.value then
										finity.gs["TweenService"]:Create(cheat.outerbox, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_checked}):Play()
										finity.gs["TweenService"]:Create(cheat.checkboxbutton, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_checked}):Play()
									else
										finity.gs["TweenService"]:Create(cheat.outerbox, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_outer}):Play()
										finity.gs["TweenService"]:Create(cheat.checkboxbutton, TweenInfo.new(0.2), {ImageColor3 = theme.checkbox_inner}):Play()
									end
									if callback then
										local s, e = pcall(function()
											callback(cheat.value)
										end)
										if not s then
											warn("error: "..e)
										end
									end
								end

								cheat.hsvbar.Parent = cheat.container
								cheat.arrowpreview.Parent = cheat.hsvbar
							elseif string.lower(kind) == "dropdown" or string.lower(kind) == "Dropdown" then
								if data then
									if data.default then
										cheat.value = data.default
									elseif data.options then
										cheat.value = data.options[1]
									else
										cheat.value = "None"
									end
								end

								local options

								if data and data.options then
									options = data.options
								end

								cheat.dropped = false -- if the button was pressed to display the elements (content)

								-- what creates the drop down button

								cheat.dropdown = finity:Create("ImageButton", {
									Name = "Dropdown",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Size = UDim2.new(1, 0, 1, 0),
									ZIndex = 3,
									Image = GetAssetFunc("MoonriseUI/assets/DropDown.png"),
									ImageColor3 = theme.dropdown_background,
									ImageTransparency = 0.5,
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.02
								})

								cheat.selected = finity:Create("TextLabel", {
									Name = "Selected",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Position = UDim2.new(0, 10, 0, 0),
									Size = UDim2.new(1, -35, 1, 0),
									ZIndex = 3,
									Font = Enum.Font.Gotham,
									Text = tostring(cheat.value),
									TextColor3 = theme.dropdown_text,
									TextSize = 13,
									TextXAlignment = Enum.TextXAlignment.Left
								})

								cheat.list = finity:Create("ScrollingFrame", {
									Name = "List",
									BackgroundColor3 = theme.dropdown_background,
									BackgroundTransparency = 0.5,
									BorderSizePixel = 0,
									Position = UDim2.new(0, 0, 1, 0),
									Size = UDim2.new(1, 0, 0, 100),
									ZIndex = 3,
									BottomImage = GetAssetFunc("MoonriseUI/assets/CheatList.png"),
									MidImage = GetAssetFunc("MoonriseUI/assets/CheatList.png"),
									TopImage = GetAssetFunc("MoonriseUI/assets/CheatList.png"),
									ScrollBarThickness = theme.dropdown_scrollbar_thickness,
									VerticalScrollBarInset = Enum.ScrollBarInset.None,
									ScrollBarImageColor3 = theme.dropdown_scrollbar_color
								})

								-- creats the list layout element for the elements of the dropdown.

								local uilistlayout = finity:Create("UIListLayout", {
									SortOrder = Enum.SortOrder.LayoutOrder,
									Padding = UDim.new(0, 2)
								})
								
								uilistlayout.Parent = cheat.list
								uilistlayout = nil
								
								local uipadding = finity:Create("UIPadding", {
									PaddingLeft = UDim.new(0, 2)
								})

								uipadding.Parent = cheat.list
								uipadding = nil

								-- refreshes the options.

								function cheat.dropdown.refreshOptions()
									if cheat.dropped then
										cheat.fadelist()
									end

									for _, child in next, cheat.list:GetChildren() do
										if child:IsA("TextButton") then
											child:Destroy()
										end
									end

									for _, value in next, options do
										local button = finity:Create("TextButton", {
											BackgroundColor3 = Color3.new(1, 1, 1),
											BackgroundTransparency = 1,
											Size = UDim2.new(1, 0, 0, 20),
											ZIndex = 3,
											Font = Enum.Font.Gotham,
											Text = value,
											TextColor3 = theme.dropdown_text,
											TextSize = 13
										})

										button.Parent = cheat.list

										button.MouseEnter:Connect(function()
											finity.gs["TweenService"]:Create(button, TweenInfo.new(0.1), {TextColor3 = theme.dropdown_text_hover}):Play()
										end)
										button.MouseLeave:Connect(function()
											finity.gs["TweenService"]:Create(button, TweenInfo.new(0.1), {TextColor3 = theme.dropdown_text}):Play()
										end)
										button.MouseButton1Click:Connect(function()
											if cheat.dropped then
												cheat.value = value
												cheat.selected.Text = value

												cheat.fadelist()

												if callback then
													local s, e = pcall(function()
														callback(cheat.value)
													end)

													if not s then warn("error: ".. e) end
												end
											end
										end)


										finity.gs["TweenService"]:Create(button, TweenInfo.new(0), {TextTransparency = 1}):Play()
									end

									finity.gs["TweenService"]:Create(cheat.list, TweenInfo.new(0), {Size = UDim2.new(1, 0, 0, 0), Position = UDim2.new(0, 0, 1, 0), CanvasSize = UDim2.new(0, 0, 0, cheat.list["UIListLayout"].AbsoluteContentSize.Y), ScrollBarImageTransparency = 1, BackgroundTransparency = 1}):Play()
								end


								function cheat.fadelist()
									cheat.dropped = not cheat.dropped

									if cheat.dropped then
										for _, button in next, cheat.list:GetChildren() do
											if button:IsA("TextButton") then
												finity.gs["TweenService"]:Create(button, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
											end
										end

										finity.gs["TweenService"]:Create(cheat.list, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, math.clamp(cheat.list["UIListLayout"].AbsoluteContentSize.Y, 0, 150)), Position = UDim2.new(0, 0, 1, 0), ScrollBarImageTransparency = 0, BackgroundTransparency = 0.5}):Play()
									else
										for _, button in next, cheat.list:GetChildren() do
											if button:IsA("TextButton") then
												finity.gs["TweenService"]:Create(button, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
											end
										end

										finity.gs["TweenService"]:Create(cheat.list, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0), Position = UDim2.new(0, 0, 1, 0), ScrollBarImageTransparency = 1, BackgroundTransparency = 1}):Play()
									end
								end

								-- hover effects

								cheat.dropdown.MouseEnter:Connect(function()
									finity.gs["TweenService"]:Create(cheat.selected, TweenInfo.new(0.1), {TextColor3 = theme.dropdown_text_hover}):Play()
								end)
								cheat.dropdown.MouseLeave:Connect(function()
									finity.gs["TweenService"]:Create(cheat.selected, TweenInfo.new(0.1), {TextColor3 = theme.dropdown_text}):Play()
								end)
								cheat.dropdown.MouseButton1Click:Connect(function()
									cheat.fadelist()
								end)

								cheat.dropdown.refreshOptions()

								function cheat:RemoveOption(value)
									local removed = false
									for index, option in next, options do
										if option == value then
											table.remove(options, index)
											removed = true
											break
										end
									end

									if removed then
										cheat.dropdown.refreshOptions()
									end

									return removed
								end

								function cheat:AddOption(value)
									table.insert(options, value)

									cheat.dropdown.refreshOptions()
								end

								function cheat:SetValue(value)
									cheat.selected.Text = value
									cheat.value = value

									if cheat.dropped then
										cheat.fadelist()
									end

									if callback then
										local s, e = pcall(function()
											callback(cheat.value)
										end)

										if not s then warn("error: ".. e) end
									end
								end

								cheat.selected.Parent = cheat.dropdown
								cheat.dropdown.Parent = cheat.container
								cheat.list.Parent = cheat.container

							elseif string.lower(kind) == "textbox" or string.lower(kind) == "Textbox"then
								local placeholdertext = data and data.placeholder

								cheat.background = finity:Create("ImageLabel", {
									Name = "Background",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Size = UDim2.new(1, 0, 1, 0),
									ZIndex = 2,
									Image = GetAssetFunc("MoonriseUI/assets/CheatBackground.png"),
									ImageColor3 = theme.textbox_background,
									ImageTransparency = 0.5,
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.02
								})

								cheat.textbox = finity:Create("TextBox", {
									Name = "Textbox",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Position = UDim2.new(0, 0, 0, 0),
									Size = UDim2.new(1, 0, 1, 0),
									ZIndex = 2,
									Font = Enum.Font.Gotham,
									Text = "",
									TextColor3 = theme.textbox_text,
									PlaceholderText = placeholdertext or "Value",
									TextSize = 13,
									TextXAlignment = Enum.TextXAlignment.Center,
									ClearTextOnFocus = false
								})

								cheat.background.MouseEnter:Connect(function()
									finity.gs["TweenService"]:Create(cheat.textbox, TweenInfo.new(0.1), {TextColor3 = theme.textbox_text_hover}):Play()
								end)
								cheat.background.MouseLeave:Connect(function()
									finity.gs["TweenService"]:Create(cheat.textbox, TweenInfo.new(0.1), {TextColor3 = theme.textbox_text}):Play()
								end)
								cheat.textbox.Focused:Connect(function()
									typing = true

									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.textbox_background_hover}):Play()
								end)
								cheat.textbox.FocusLost:Connect(function()
									typing = false

									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.textbox_background}):Play()
									finity.gs["TweenService"]:Create(cheat.textbox, TweenInfo.new(0.1), {TextColor3 = theme.textbox_text}):Play()

									cheat.value = cheat.textbox.Text

									if callback then
										local s, e = pcall(function()
											callback(cheat.value)
										end)

										if not s then warn("error: "..e) end
									end
								end)
								function cheat:SetValue(value)
									cheat.value = tostring(value)
									cheat.textbox.Text = tostring(value)
								end

								cheat.background.Parent = cheat.container
								cheat.textbox.Parent = cheat.container
							elseif string.lower(kind) == "slider" or "Slider" then
								cheat.value = 0

								local suffix = data.suffix or ""
								local minimum = data.min or 0
								local maximum = data.max or 1
								local default = data.default
								local precise = data.precise

								local moveconnection
								local releaseconnection

								cheat.sliderbar = finity:Create("ImageButton", {
									Name = "Sliderbar",
									AnchorPoint = Vector2.new(1, 0.5),
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Position = UDim2.new(1, 0, 0.5, 0),
									Size = UDim2.new(1, 0, 0, 6),
									ZIndex = 2,
									Image = GetAssetFunc("MoonriseUI/assets/CheatSliderbar.png"),
									ImageColor3 = theme.slider_background,
									ImageTransparency = 0.5,
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.02,
								})

								cheat.numbervalue = finity:Create("TextLabel", {
									Name = "Value",
									AnchorPoint = Vector2.new(0, 0.5),
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Position = UDim2.new(0.5, 5, 0.5, 0),
									Size = UDim2.new(1, 0, 0, 13),
									ZIndex = 2,
									Font = Enum.Font.Gotham,
									TextXAlignment = Enum.TextXAlignment.Left,
									Text = minimum,
									TextTransparency = 1,
									TextColor3 = theme.slider_text,
									TextSize = 13,
								})

								cheat.visiframe = finity:Create("ImageLabel", {
									Name = "Frame",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Size = UDim2.new(0.5, 0, 1, 0),
									ZIndex = 2,
									Image = GetAssetFunc("MoonriseUI/assets/CheatVisiFrame.png"),
									ImageColor3 = theme.slider_color,
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.02
								})

								-- slider math and shit

								if data.default then
									local size = math.clamp(data.default - cheat.sliderbar.AbsolutePosition.X, 0, 150)
									local percent = size / 150
									local perc = default/maximum
									cheat.value = math.floor((minimum + (maximum - minimum) * percent) * 100) / 100
									finity.gs["TweenService"]:Create(cheat.visiframe, TweenInfo.new(0.1), {
										Size = UDim2.new(perc, 0, 1, 0),
									}):Play()
									if callback then
										local s, e = pcall(function()
											callback(cheat.value)
										end)

										if not s then warn("error: ".. e) end
									end
								end

								function cheat:SetValue(value)
									local size = math.clamp(value - cheat.sliderbar.AbsolutePosition.X, 0, 150)
									local percent = size / 150
									local perc = default/maximum
									cheat.value = math.floor((minimum + (maximum - minimum) * percent) * 100) / 100
									finity.gs["TweenService"]:Create(cheat.visiframe, TweenInfo.new(0.1), {
										Size = UDim2.new(perc, 0, 1, 0),
									}):Play()
									if callback then
										local s, e = pcall(function()
											callback(cheat.value)
										end)

										if not s then warn("error: ".. e) end
									end
								end

								cheat.sliderbar.MouseButton1Down:Connect(function()
									local size = math.clamp(mouse.X - cheat.sliderbar.AbsolutePosition.X, 0, 150)
									local percent = size / 150

									cheat.value = math.floor((minimum + (maximum - minimum) * percent) * 100) / 100

									if precise then
										cheat.numbervalue.Text = suffix .. math.ceil(tostring(cheat.value))
									else
										cheat.numbervalue.Text = suffix .. tostring(cheat.value)
									end

									if callback then
										local s, e = pcall(function()
											if data.precise then
												callback(cheat.value)
											else
												callback(math.ceil(cheat.value))
											end
										end)

										if not s then warn("error: ".. e) end
									end

									finity.gs["TweenService"]:Create(cheat.visiframe, TweenInfo.new(0.1), {
										Size = UDim2.new(size / 150, 0, 1, 0),
										ImageColor3 = theme.slider_color_sliding
									}):Play()

									finity.gs["TweenService"]:Create(cheat.numbervalue, TweenInfo.new(0.1), {
										Position = UDim2.new(size / 150, 5, 0.5, 0),
										TextTransparency = 0
									}):Play()

									moveconnection = mouse.Move:Connect(function()
										local size = math.clamp(mouse.X - cheat.sliderbar.AbsolutePosition.X, 0, 150)
										local percent = size / 150

										cheat.value = math.floor((minimum + (maximum - minimum) * percent) * 100) / 100
										if precise then
											cheat.numbervalue.Text = suffix .. math.ceil(tostring(cheat.value))
										else
											cheat.numbervalue.Text = suffix .. tostring(cheat.value)
										end

										if callback then
											local s, e = pcall(function()
												if data.precise then
													callback(cheat.value)
												else
													callback(math.ceil(cheat.value))
												end
											end)

											if not s then warn("error: ".. e) end
										end

										finity.gs["TweenService"]:Create(cheat.visiframe, TweenInfo.new(0.1), {
											Size = UDim2.new(size / 150, 0, 1, 0),
											ImageColor3 = theme.slider_color_sliding
										}):Play()

										local Position = UDim2.new(size / 150, 5, 0.5, 0);

										if Position.Width.Scale >= 0.6 then
											Position = UDim2.new(1, -cheat.numbervalue.TextBounds.X, 0.5, 10);
										end

										finity.gs["TweenService"]:Create(cheat.numbervalue, TweenInfo.new(0.1), {
											Position = Position,
											TextTransparency = 0
										}):Play()
									end)

									releaseconnection = finity.gs["UserInputService"].InputEnded:Connect(function(Mouse)
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then

											finity.gs["TweenService"]:Create(cheat.visiframe, TweenInfo.new(0.1), {
												ImageColor3 = theme.slider_color
											}):Play()

											finity.gs["TweenService"]:Create(cheat.numbervalue, TweenInfo.new(0.1), {
												TextTransparency = 1
											}):Play()

											moveconnection:Disconnect()
											moveconnection = nil
											releaseconnection:Disconnect()
											releaseconnection = nil
										end
									end)
								end)

								cheat.visiframe.Parent = cheat.sliderbar
								cheat.numbervalue.Parent = cheat.sliderbar
								cheat.sliderbar.Parent = cheat.container

							elseif string.lower(kind) == "button" or string.lower(kind) == "Button" then
								local button_text = name

								cheat.background = finity:Create("ImageLabel", {
									Name = "Background",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Size = UDim2.new(1, 0, 1, 0),
									ZIndex = 2,
									Image = GetAssetFunc("MoonriseUI/assets/CheatBackground.png"),
									ImageColor3 = theme.button_background,
									ImageTransparency = 0.5,
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.02
								})

								cheat.button = finity:Create("TextButton", {
									Name = "Button",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Position = UDim2.new(0, 0, 0, 0),
									Size = UDim2.new(1, 0, 1, 0),
									ZIndex = 2,
									Font = Enum.Font.Gotham,
									Text = button_text, --or "Button",
									TextColor3 = theme.textbox_text,
									TextSize = 13,
									TextXAlignment = Enum.TextXAlignment.Center
								})

								cheat.button.MouseEnter:Connect(function()
									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.button_background_hover}):Play()
								end)
								cheat.button.MouseLeave:Connect(function()
									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.button_background}):Play()
								end)
								cheat.button.MouseButton1Down:Connect(function()
									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.button_background_down}):Play()
								end)
								cheat.button.MouseButton1Up:Connect(function()
									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.button_background}):Play()

									if callback then
										local s, e = pcall(function()
											callback()
										end)

										if not s then warn("error: ".. e) end
									end
								end)

								function cheat:Fire()
									if callback then
										local s, e = pcall(function()
											callback()
										end)

										if not s then warn("error: ".. e) end
									end
								end

								cheat.background.Parent = cheat.container
								cheat.button.Parent = cheat.container

							elseif string.lower(kind) == "keybind" or string.lower(kind) == "bind" or "Keybind" or "Bind" then
								local callback_bind = data and data.bind
								local connection
								cheat.holding = false

								cheat.background = finity:Create("ImageLabel", {
									Name = "Background",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Size = UDim2.new(1, 0, 1, 0),
									ZIndex = 2,
									Image = GetAssetFunc("MoonriseUI/assets/CheatBackground.png"),
									ImageColor3 = theme.button_background,
									ImageTransparency = 0.5,
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.02
								})

								cheat.button = finity:Create("TextButton", {
									Name = "Button",
									BackgroundColor3 = Color3.new(1, 1, 1),
									BackgroundTransparency = 1,
									Position = UDim2.new(0, 0, 0, 0),
									Size = UDim2.new(1, 0, 1, 0),
									ZIndex = 2,
									Font = Enum.Font.Gotham,
									Text = "Click to Bind",
									TextColor3 = theme.textbox_text,
									TextSize = 13,
									TextXAlignment = Enum.TextXAlignment.Center
								})

								-- hover stuff
								cheat.button.MouseEnter:Connect(function()
									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.button_background_hover}):Play()
								end)
								cheat.button.MouseLeave:Connect(function()
									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.button_background}):Play()
								end)
								cheat.button.MouseButton1Down:Connect(function()
									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.button_background_down}):Play()
								end)
								cheat.button.MouseButton2Down:Connect(function()
									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.button_background_down}):Play()
								end)

								-- when the button is clicked we then want to start listening for a keycode input. IF we get a keycode we set it otherwise we throw an error
								cheat.button.MouseButton1Up:Connect(function()
									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.button_background}):Play()
									cheat.button.Text = "Press Any key to bind"

									if connection then
										connection:Disconnect()
										connection = nil
									end
									cheat.holding = false

									connection = finity.gs["UserInputService"].InputBegan:Connect(function(Input)
										if Input.UserInputType.Name == "Keyboard" and Input.KeyCode ~= finityData.ToggleKey and Input.KeyCode ~= Enum.KeyCode.Backspace then
											cheat.button.Text = "Bound to " .. tostring(Input.KeyCode.Name)

											if connection then
												connection:Disconnect()
												connection = nil
											end

											task.delay(0, function()
												callback_bind = Input.KeyCode
												cheat.value = Input.KeyCode

												if callback then
													local s, e = pcall(function()
														callback(Input.KeyCode)
													end)

													if not s then warn("error: ".. e) end
												end
											end)

										-- here we remove the current keybind.
										elseif Input.KeyCode == Enum.KeyCode.Backspace then
											callback_bind = nil
											cheat.button.Text = "Click to Bind"
											cheat.value = nil
											cheat.holding = false
											task.delay(0, function()
												if callback then
													local s, e = pcall(function()
														callback()
													end)

													if not s then error("error: ".. e, 5) end
												end
											end)

											connection:Disconnect()
											connection = nil
										elseif Input.KeyCode == finityData.ToggleKey then
											cheat.button.Text = "Cannot bind to Toggle Key: "..finityData.ToggleKey.Value;
											cheat.value = nil
										end
									end)
								end)

								cheat.button.MouseButton2Up:Connect(function()
									finity.gs["TweenService"]:Create(cheat.background, TweenInfo.new(0.2), {ImageColor3 = theme.button_background}):Play()
									cheat.value = nil
									callback_bind = nil
									cheat.button.Text = "Click to Bind"
									cheat.holding = false

									task.delay(0, function()
										if callback then
											local s, e = pcall(function()
												callback()
											end)

											if not s then warn("error: ".. e) end
										end
									end)

									if connection then
										connection:Disconnect()
										connection = nil
									end
								end)

								function cheat:SetValue(value)
									cheat.value = tostring(value)
									cheat.button.Text = "Bound to " .. tostring(value)
								end

								finity.gs["UserInputService"].InputBegan:Connect(function(Input, Process)
									if callback_bind and Input.KeyCode == callback_bind and not Process then
										cheat.holding = true
										if callback then
											local s, e = pcall(function()
												callback(Input.KeyCode)
											end)

											if not s then warn("error: ".. e) end
										end
									end
								end)
								finity.gs["UserInputService"].InputBegan:Connect(function(Input, Process)
									if callback_bind and Input.KeyCode == callback_bind and not Process then
										cheat.holding = true
									end
								end)

								if callback_bind then
									cheat.button.Text = "Bound to " .. tostring(callback_bind.Name)
								end

								cheat.background.Parent = cheat.container
								cheat.button.Parent = cheat.container
							end
						end

						cheat.frame.Parent = sector.container
						cheat.label.Parent = cheat.frame
						cheat.container.Parent = cheat.frame

						return cheat
					end

					sector.frame.Parent = category[calculateSector()]
					sector.container.Parent = sector.frame
					sector.title.Parent = sector.frame

					return sector
				end

				firstCategory = false

				return category
			end

			finity:addShadow(self2.container, 0)

			self2.categories.ClipsDescendants = true

			if not finity.gs["RunService"]:IsStudio() then

				self2.userinterface.Parent = self.gs["CoreGui"]
			else
				error("Could not parent Finity to the CoreGui. This is fatal.", 5) -- At any point do we not want the Gui to move to script accessable instances like 'PlayerGui'.
			end

			self2.container.Parent = self2.userinterface
			self2.categories.Parent = self2.container
			self2.sidebar.Parent = self2.container
			self2.topbar.Parent = self2.container
			self2.title.Parent = self2.topbar

			if Title and not HideToolTip and ToolTipText == "" or ToolTipText == " " or ToolTipText == nil then -- if theres a title and we dont hide the tool tip but we dont have any tool tip text
				self2.title.Text = Title

			elseif Title and HideToolTip then -- if the tool tip is hidden and we have a title
				self2.title.Text = Title

			elseif not HideToolTip and ToolTipText and Title then
				self2.title.Text = ToolTipText

			elseif not Title and HideToolTip then -- if we dont have a title and we hide the tool tip
				self2.title.Text = "Place holder"

			elseif not HideToolTip and ToolTipText and Title then -- if theres a title and we dont hide the tool tip and there is text for the tool tip
				self2.title.Text = Title.." | "..ToolTipText -- This is a title | This is a tool tip text | This is some version
			end

			return self2, finityData
		end

	elseif not game.Loaded then repeat until game.Loaded end

end)

--[[
	The code for the toast is from Vape Same for the bettertween2 function: https://github.com/7GrandDadPGN/VapeV4ForRoblox
]]

	function finity.bettertween2(obj, newpos, dir, style, time, override)
		task.spawn(function()
			local frame = Instance.new("Frame")
			frame.Visible = false
			frame.Position = obj.Position
			frame.Parent = self2.userinterface
			frame.Name = "BetterTween2"
			frame:GetPropertyChangedSignal("Position"):Connect(function()
				obj.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, obj.Position.Y.Scale, obj.Position.Y.Offset)
			end)
			pcall(function()
				frame:TweenPosition(newpos, dir, style, time, override)
			end)
			frame.Parent = nil
			task.wait(time)
			frame:Remove()
		end)
	end

	function finity:EnableDebugging(status: boolean)
		if status then
			debug = true
		else
			debug = false
		end
	end

if not suc then warn(err) end

return finity
