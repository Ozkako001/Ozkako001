if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
    _G.Color = Color3.fromRGB(255,0,0)
    if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
    
    repeat wait() until game:GetService("Players")
    
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end
        
    wait(1)
    
    do
        local ui = game.CoreGui:FindFirstChild("UlLib")
        if ui then
            ui:Destroy()
        end
    end
    
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    
    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil
    
        local function Update(input)
            local Delta = input.Position - DragStart
            local pos =
                UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset + Delta.X,
                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset + Delta.Y
                )
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
            Tween:Play()
        end
    
        topbarobject.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    DragStart = input.Position
                    StartPosition = object.Position
    
                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                            end
                        end
                    )
                end
            end
        )
    
        topbarobject.InputChanged:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
                then
                    DragInput = input
                end
            end
        )
    
        UserInputService.InputChanged:Connect(
            function(input)
                if input == DragInput and Dragging then
                    Update(input)
                end
            end
        )
    end
    
    local library = {}
    
    function library:AddWindow(text,keybind)
        local bind = keybind or Enum.KeyCode.RightControl
        local ff = false
        local currenttab = ""
    
        local DoctorShiba = Instance.new("ScreenGui")
        DoctorShiba.Name = "UlLib"
        DoctorShiba.Parent = game.CoreGui
        DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = DoctorShiba
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
        Main.BackgroundTransparency = 0.100
        Main.BorderSizePixel = 0
        Main.ClipsDescendants = true
        Main.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
        Main.Size = UDim2.new(0, 600, 0, 350)
    
        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Top.BackgroundTransparency = 1.000
        Top.BorderSizePixel = 0
        Top.Size = UDim2.new(0, 600, 0, 20)
    
        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Main
        Page.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
        Page.BackgroundTransparency = 0.100
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(0, 125, 0, 350)
    
        local NameHub = Instance.new("TextLabel")
        NameHub.Name = "NameHub"
        NameHub.Parent = Page
        NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameHub.BackgroundTransparency = 1.000
        NameHub.Position = UDim2.new(0.113333493, 0, 0, 0)
        NameHub.Size = UDim2.new(0, 110, 0, 20)
        NameHub.Font = Enum.Font.GothamSemibold
        NameHub.Text = text
        NameHub.TextColor3 = Color3.fromRGB(225, 0, 0)
        NameHub.TextSize = 11.000
        NameHub.TextXAlignment = Enum.TextXAlignment.Left
    
        local User = Instance.new("Frame")
        User.Name = "User"
        User.Parent = Page
        User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        User.BackgroundTransparency = 1.000
        User.Position = UDim2.new(0, 0, 0.8, 30)
        User.Size = UDim2.new(0, 125, 0, 40)
    
        local UserText = Instance.new("TextLabel")
        UserText.Name = "UserText"
        UserText.Parent = User
        UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        UserText.BackgroundTransparency = 1.000
        UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
        UserText.Size = UDim2.new(0, 80, 0, 20)
        UserText.Font = Enum.Font.Gotham
        UserText.Text = tostring(game.Players.LocalPlayer.Name) 
        spawn(function()
            while wait() do
                pcall(function()
                    wait(0.1) 
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 155, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 155, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 155)}
                    ):Play() 
                    wait(.5)
                end)
            end
        end)
        UserText.TextScaled = true
        UserText.TextSize = 11.000
        UserText.TextWrapped = true
        UserText.TextXAlignment = Enum.TextXAlignment.Left
    
        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint.Parent = UserText
        UITextSizeConstraint.MaxTextSize = 11
    
        local UserImage = Instance.new("ImageLabel")
        UserImage.Name = "UserImage"
        UserImage.Parent = User
        UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        UserImage.Position = UDim2.new(0, 10, 0, 9)
        UserImage.Size = UDim2.new(0, 25, 0, 25)
        UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"
    
        local UserImageCorner = Instance.new("UICorner")
        UserImageCorner.CornerRadius = UDim.new(0, 100)
        UserImageCorner.Name = "UserImageCorner"
        UserImageCorner.Parent = UserImage
    
        local ScrollPage = Instance.new("ScrollingFrame")
        ScrollPage.Name = "ScrollPage"
        ScrollPage.Parent = Page
        ScrollPage.Active = true
        ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollPage.BackgroundTransparency = 1.000
        ScrollPage.BorderSizePixel = 0
        ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
        ScrollPage.Size = UDim2.new(0, 125, 0, 290)
        ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollPage.ScrollBarThickness = 0
        local PageList = Instance.new("UIListLayout")
        PageList.Name = "PageList"
        PageList.Parent = ScrollPage
        PageList.SortOrder = Enum.SortOrder.LayoutOrder
        PageList.Padding = UDim.new(0, 7)
    
        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = ScrollPage
        PagePadding.PaddingTop = UDim.new(0, 5)
        PagePadding.PaddingLeft = UDim.new(0, 28)
    
        local TabFolder = Instance.new("Folder")
        TabFolder.Name = "TabFolder"
        TabFolder.Parent = Main
    
        MakeDraggable(Top,Main)
    
        local uihide = false
    
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == bind then
                if uihide == false then
                    uihide = true
                    Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.2,true)
                else
                    uihide = false
                    Main:TweenSize(UDim2.new(0, 600, 0, 350),"Out","Quad",0.2,true)
                end
            end
        end)
    
        local uitab = {}
    
        function uitab:AddTab(text,image)
            local Image = image or 6023426915
    
            local PageButton = Instance.new("TextButton")
            PageButton.Name = "PageButton"
            PageButton.Parent = ScrollPage
            PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageButton.BackgroundTransparency = 1.000
            PageButton.BorderSizePixel = 0
            PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
            PageButton.Size = UDim2.new(0, 97, 0, 20)
            PageButton.AutoButtonColor = false
            PageButton.Font = Enum.Font.GothamSemibold
            PageButton.Text = text
            PageButton.TextColor3 = Color3.fromRGB(225, 225, 225)
            PageButton.TextSize = 11.000
            PageButton.TextXAlignment = Enum.TextXAlignment.Left
            
            local PageImage = Instance.new("ImageLabel")
            PageImage.Name = "PageImage"
            PageImage.Parent = PageButton
            PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageImage.BackgroundTransparency = 1.000
            PageImage.Position = UDim2.new(0, -20, 0, 3)
            PageImage.Size = UDim2.new(0, 15, 0, 15)
            PageImage.Image = "rbxassetid://"..tostring(Image)
    
            local MainTab = Instance.new("Frame")
            MainTab.Name = "MainTab"
            MainTab.Parent = TabFolder
            MainTab.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            MainTab.BorderSizePixel = 0
            MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
            MainTab.Size = UDim2.new(0, 475, 0, 350)
            MainTab.Visible = false
    
            local ScrollTab = Instance.new("ScrollingFrame")
            ScrollTab.Name = "ScrollTab"
            ScrollTab.Parent = MainTab
            ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollTab.BackgroundTransparency = 1.000
            ScrollTab.BorderSizePixel = 0
            ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
            ScrollTab.Size = UDim2.new(0, 475, 0, 330)
            ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollTab.ScrollBarThickness = 3
    
            local TabList = Instance.new("UIListLayout")
            TabList.Name = "TabList"
            TabList.Parent = ScrollTab
            TabList.SortOrder = Enum.SortOrder.LayoutOrder
            TabList.Padding = UDim.new(0, 5)
    
            local TabPadding = Instance.new("UIPadding")
            TabPadding.Name = "TabPadding"
            TabPadding.Parent = ScrollTab
            TabPadding.PaddingLeft = UDim.new(0, 10)
            TabPadding.PaddingTop = UDim.new(0, 10)
    
            PageButton.MouseButton1Click:Connect(function()
                currenttab = MainTab.Name
                for i,v in next, TabFolder:GetChildren() do 
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                end
                MainTab.Visible = true
    
                for i,v in next, ScrollPage:GetChildren() do 
                    if v:IsA("TextButton") then
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(225, 225, 225)}
                        ):Play()
                    end
                    TweenService:Create(
                        PageButton,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end
            end)
    
            if ff == false then
                TweenService:Create(
                    PageButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,0,0)}
                ):Play()
                for i,v in next, TabFolder:GetChildren() do 
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                    MainTab.Visible = true
                end
                ff = true
            end
    
            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 10)
                    ScrollTab.CanvasSize = UDim2.new(0,0,0,TabList.AbsoluteContentSize.Y + 30)
                end)
            end)
            
            local main = {}
            
            function main:AddButton(text,callback)
                local Button = Instance.new("TextButton")
    
                Button.Name = "Button"
                Button.Parent = ScrollTab
                Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Button.BackgroundTransparency = 0.1
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0, 455, 0, 30)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Gotham
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(225, 225, 225)
                Button.TextSize = 11.000
                Button.TextWrapped = true
                
                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Parent = Button
                
                Button.MouseEnter:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
                
                Button.MouseLeave:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)
                
                Button.MouseButton1Click:Connect(function()
                    callback()
                    Button.TextSize = 0
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                        {TextSize = 11}
                    ):Play()
                end)
            end
            
            function main:AddToggle(text,config,callback)
                local ToggleImage = Instance.new("Frame")
                
                local Toggle = Instance.new("TextButton")
                Toggle.Name = "Toggle"
                Toggle.Parent = ScrollTab
                Toggle.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Toggle.BackgroundTransparency = 0.1
                Toggle.BorderSizePixel = 0
                Toggle.AutoButtonColor = false
                Toggle.Size = UDim2.new(0, 455, 0, 30)
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000
                
                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Parent = Toggle
    
                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Parent = Toggle
                ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleLabel.BackgroundTransparency = 1.000
                ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
                ToggleLabel.Size = UDim2.new(0, 410, 0, 30)
                ToggleLabel.Font = Enum.Font.Gotham
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                ToggleLabel.TextSize = 11.000
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Toggle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
                ToggleImage.Position = UDim2.new(0, 425, 0, 5)
                ToggleImage.BorderSizePixel = 0
                ToggleImage.Size = UDim2.new(0, 20, 0, 20)
                local ToggleImageCorner = Instance.new("UICorner")
                ToggleImageCorner.Name = "ToggleImageCorner"
                ToggleImageCorner.CornerRadius = UDim.new(0, 5)
                ToggleImageCorner.Parent = ToggleImage
    
                local ToggleImage2 = Instance.new("Frame")
                ToggleImage2.Name = "ToggleImage2"
                ToggleImage2.Parent = ToggleImage
                ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleImage2.BackgroundColor3 = Color3.fromRGB(255,0,0)
                ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
                ToggleImage2.Visible = false
    
                local ToggleImage2Corner = Instance.new("UICorner")
                ToggleImage2Corner.Name = "ToggleImageCorner"
                ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
                ToggleImage2Corner.Parent = ToggleImage2
                
                Toggle.MouseEnter:Connect(function()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
    
                Toggle.MouseLeave:Connect(function()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)
                if config == nil then config = false end
                local toggled = config or false
                Toggle.MouseButton1Click:Connect(function()
                    if toggled == false then
                        toggled = true
                        ToggleImage2.Visible = true
                        ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                    else
                        toggled = false
                        ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.1,true)
                        wait(0.1)
                        ToggleImage2.Visible = false
                    end
                    callback(toggled)
                end)
                
                if config == true then
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                    toggled = true
                    callback(toggled)
                end
            end
    
            function main:AddTextbox(text,holder,disappear,callback)
                local Textboxx = Instance.new("Frame")
                local TextboxxCorner = Instance.new("UICorner")
                local TextboxTitle = Instance.new("TextLabel")
                local Textbox = Instance.new("TextBox")
                local TextboxCorner = Instance.new("UICorner")
    
                Textboxx.Name = "Textboxx"
                Textboxx.Parent = ScrollTab
                Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Textboxx.Size = UDim2.new(0, 455, 0, 30)
    
                TextboxxCorner.CornerRadius = UDim.new(0, 5)
                TextboxxCorner.Name = "TextboxxCorner"
                TextboxxCorner.Parent = Textboxx
    
                TextboxTitle.Name = "TextboxTitle"
                TextboxTitle.Parent = Textboxx
                TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.BackgroundTransparency = 1.000
                TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
                TextboxTitle.Size = UDim2.new(0, 300, 0, 30)
                TextboxTitle.Font = Enum.Font.Gotham
                TextboxTitle.Text = text
                TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextboxTitle.TextSize = 11.000
                TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                Textbox.Name = "Textbox"
                Textbox.Parent = Textboxx
                Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Textbox.Position = UDim2.new(0, 310, 0, 5)
                Textbox.Size = UDim2.new(0, 140, 0, 20)
                Textbox.Font = Enum.Font.Gotham
                Textbox.Text = holder
                Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                Textbox.TextSize = 11.000
    
                Textbox.FocusLost:Connect(function()
                    if #Textbox.Text > 0 then
                        callback(Textbox.Text)
                    end
                    if disappear then
                        Textbox.Text = ""
                    else
                        Textbox.Text = holder
                    end
                end)
    
                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Parent = Textbox
            end
    
            function main:AddDropdown(text,table,callback)
                local Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropButton = Instance.new("TextButton")
                local Droptitle = Instance.new("TextLabel")
                local DropScroll = Instance.new("ScrollingFrame")
                local DropdownList = Instance.new("UIListLayout")
                local DropdownPadding = Instance.new("UIPadding")
                local DropImage = Instance.new("ImageLabel")
                
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = ScrollTab
                Dropdown.Active = true
                Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(0, 455, 0, 30)
                
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Dropdown
                
                DropButton.Name = "DropButton"
                DropButton.Parent = Dropdown
                DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton.BackgroundTransparency = 1.000
                DropButton.Size = UDim2.new(0, 455, 0, 30)
                DropButton.Font = Enum.Font.SourceSans
                DropButton.Text = ""
                DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropButton.TextSize = 14.000
                
                Droptitle.Name = "Droptitle"
                Droptitle.Parent = Dropdown
                Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Droptitle.BackgroundTransparency = 1.000
                Droptitle.Position = UDim2.new(0.0281690136, 0, 0, 0)
                Droptitle.Size = UDim2.new(0, 410, 0, 30)
                Droptitle.Font = Enum.Font.Gotham
                Droptitle.Text = text.." : "
                Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                Droptitle.TextSize = 11.000
                Droptitle.TextXAlignment = Enum.TextXAlignment.Left
    
                DropImage.Name = "DropImage"
                DropImage.Parent = Dropdown
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.Position = UDim2.new(0, 425, 0, 5)
                DropImage.Rotation = 0
                DropImage.Size = UDim2.new(0, 20, 0, 20)
                DropImage.Image = "rbxassetid://5012539403"
                
                DropScroll.Name = "DropScroll"
                DropScroll.Parent = Droptitle
                DropScroll.Active = true
                DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropScroll.BackgroundTransparency = 1.000
                DropScroll.BorderSizePixel = 0
                DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
                DropScroll.Size = UDim2.new(0, 455, 0, 70)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
                DropScroll.ScrollBarThickness = 2
                
                DropdownList.Name = "DropdownList"
                DropdownList.Parent = DropScroll
                DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownList.Padding = UDim.new(0, 5)
                
                DropdownPadding.Name = "DropdownPadding"
                DropdownPadding.Parent = DropScroll
                DropdownPadding.PaddingTop = UDim.new(0, 5)
    
                local isdropping = false
    
                for i,v in next,table do
                    local DropButton2 = Instance.new("TextButton")
    
                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(v)
    
                    DropButton2.MouseEnter:Connect(function()
                        TweenService:Create(
                            DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(255,0,0)}
                        ):Play()
                    end)
                    DropButton2.MouseLeave:Connect(function()
                        TweenService:Create(
                            DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(225, 225, 225)}
                        ):Play()
                    end)
    
                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        Droptitle.Text =  text.." : "..tostring(v)
                        callback(v)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
    
                DropButton.MouseButton1Click:Connect(function()
                    if isdropping == false then
                        isdropping = true
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 100)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = -180}
                        ):Play()
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    else
                        isdropping = false
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end
                end)
                DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
    
                local drop = {}
    
                function drop:Clear()
                    Droptitle.Text = tostring(text).." :"
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 455, 0, 30)} 
                    ):Play()
                    isdropping = false
                    for i, v in next, DropScroll:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end
                function drop:Add(t)
                    local DropButton2 = Instance.new("TextButton")
    
                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(t)
    
                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        Droptitle.Text =  text.." : "..tostring(t)
                        callback(t)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
                return drop
            end
    
            function main:AddSlider(text,min,max,set,callback)
                set = (math.clamp(set,min,max))
                if set > max then set = max end
    
                local Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local SliderTitle = Instance.new("TextLabel")
                local SliderValue = Instance.new("TextLabel")
                local SliderButton = Instance.new("TextButton")
                local Bar1 = Instance.new("Frame")
                local Bar = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local CircleBar = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UICorner_4 = Instance.new("UICorner")
    
                Slider.Name = "Slider"
                Slider.Parent = ScrollTab
                Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Slider.Size = UDim2.new(0, 455, 0, 40)
    
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Slider
    
                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0, 290, 0, 20)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderTitle.TextSize = 11.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                SliderValue.Name = "SliderValue"
                SliderValue.Parent = Slider
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(0.887778878, 0, 0, 0)
                SliderValue.Size = UDim2.new(0, 40, 0, 20)
                SliderValue.Font = Enum.Font.Gotham
                SliderValue.Text =  tostring(set and math.floor( (set / max) * (max - min) + min) or 0)
                SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderValue.TextSize = 11.000
    
                SliderButton.Name = "SliderButton"
                SliderButton.Parent = Slider
                SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderButton.BackgroundTransparency = 1.000
                SliderButton.Position = UDim2.new(0, 10, 0, 25)
                SliderButton.Size = UDim2.new(0, 435, 0, 5)
                SliderButton.AutoButtonColor = false
                SliderButton.Font = Enum.Font.SourceSans
                SliderButton.Text = ""
                SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderButton.TextSize = 14.000
    
                Bar1.Name = "Bar1"
                Bar1.Parent = SliderButton
                Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Bar1.Size = UDim2.new(0, 435, 0, 5)
    
                Bar.Name = "Bar"
                Bar.Parent = Bar1
                Bar.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Bar.Size = UDim2.new(set/max, 0, 0, 5)
    
                UICorner_2.CornerRadius = UDim.new(0, 100)
                UICorner_2.Parent = Bar
    
                CircleBar.Name = "CircleBar"
                CircleBar.Parent = Bar
                CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CircleBar.Position = UDim2.new(1, -2, 0, -2)
                CircleBar.AnchorPoint = Vector2.new(0, 0.1)
                CircleBar.Size = UDim2.new(0, 10, 0, 10)
    
                UICorner_3.CornerRadius = UDim.new(0, 100)
                UICorner_3.Parent = CircleBar
    
                UICorner_4.CornerRadius = UDim.new(0, 100)
                UICorner_4.Parent = Bar1
                
                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
    
                if Value == nil then
                    Value = set
                    pcall(function()
                        callback(Value)
                    end)
                end
                
                SliderButton.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    moveconnection = mouse.Move:Connect(function()
                        SliderValue.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                            CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        SliderValue.Text = Value
                    end
                end)
            end
            function main:AddSeperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local SepLabel = Instance.new("TextLabel")
                local Sep2 = Instance.new("Frame")
    
                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollTab
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.ClipsDescendants = true
                Seperator.Size = UDim2.new(0, 455, 0, 20)
    
                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 150, 0, 1)
    
                SepLabel.Name = "SepLabel"
                SepLabel.Parent = Seperator
                SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SepLabel.BackgroundTransparency = 1.000
                SepLabel.Position = UDim2.new(0, 95, 0, 0)
                SepLabel.Size = UDim2.new(0, 255, 0, 20)
                SepLabel.Font = Enum.Font.Gotham
                SepLabel.Text = text
                SepLabel.TextColor3 = Color3.fromRGB(225,225,225)
                SepLabel.TextSize = 11.000
    
                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep2.BorderSizePixel = 0
                Sep2.Position = UDim2.new(0, 305, 0, 10)
                Sep2.Size = UDim2.new(0, 150, 0, 1)
            end
            function main:AddLine()
                local Line = Instance.new("Frame")
                local Linee = Instance.new("Frame")
    
                Line.Name = "Line"
                Line.Parent = ScrollTab
                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Line.BackgroundTransparency = 1.000
                Line.ClipsDescendants = true
                Line.Size = UDim2.new(0, 455, 0, 20)
    
                Linee.Name = "Linee"
                Linee.Parent = Line
                Linee.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Linee.BorderSizePixel = 0
                Linee.Position = UDim2.new(0, 0, 0, 10)
                Linee.Size = UDim2.new(0, 455, 0, 1)
            end
            function main:AddLabel(text)
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}
        
                Label.Name = "Label"
                Label.Parent = ScrollTab
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 455, 0, 20)
                Label.Font = Enum.Font.Gotham
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 11.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left
    
                PaddingLabel.PaddingLeft = UDim.new(0,10)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"
        
                function labell:Set(newtext)
                    Label.Text = newtext
                end
    
                return labell
            end
            
            return main
        end
        return uitab
    end
    
    --------------------------------------------------------------------
    if game.PlaceId == 2753915549 then
        World1 = true
    elseif game.PlaceId == 4442272183 then
        World2 = true
    elseif game.PlaceId == 7449423635 then
        World3 = true
    end
    
    function CheckQuest() 
        MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
        if World1 then
            if MyLevel == 1 or MyLevel <= 9 then
                Mon = "Bandit [Lv. 5]"
                LevelQuest = 1
                NameQuest = "BanditQuest1"
                NameMon = "Bandit"
                CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
            elseif MyLevel == 10 or MyLevel <= 14 then
                Mon = "Monkey [Lv. 14]"
                LevelQuest = 1
                NameQuest = "JungleQuest"
                NameMon = "Monkey"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            elseif MyLevel == 15 or MyLevel <= 29 then
                Mon = "Gorilla [Lv. 20]"
                LevelQuest = 2
                NameQuest = "JungleQuest"
                NameMon = "Gorilla"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            elseif MyLevel == 30 or MyLevel <= 39 then
                Mon = "Pirate [Lv. 35]"
                LevelQuest = 1
                NameQuest = "BuggyQuest1"
                NameMon = "Pirate"
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            elseif MyLevel == 40 or MyLevel <= 59 then
                Mon = "Brute [Lv. 45]"
                LevelQuest = 2
                NameQuest = "BuggyQuest1"
                NameMon = "Brute"
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            elseif MyLevel == 60 or MyLevel <= 74 then
                Mon = "Desert Bandit [Lv. 60]"
                LevelQuest = 1
                NameQuest = "DesertQuest"
                NameMon = "Desert Bandit"
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            elseif MyLevel == 75 or MyLevel <= 89 then
                Mon = "Desert Officer [Lv. 70]"
                LevelQuest = 2
                NameQuest = "DesertQuest"
                NameMon = "Desert Officer"
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            elseif MyLevel == 90 or MyLevel <= 99 then
                Mon = "Snow Bandit [Lv. 90]"
                LevelQuest = 1
                NameQuest = "SnowQuest"
                NameMon = "Snow Bandit"
                CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            elseif MyLevel == 100 or MyLevel <= 119 then
                Mon = "Snowman [Lv. 100]"
                LevelQuest = 2
                NameQuest = "SnowQuest"
                NameMon = "Snowman"
                CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            elseif MyLevel == 120 or MyLevel <= 149 then
                Mon = "Chief Petty Officer [Lv. 120]"
                LevelQuest = 1
                NameQuest = "MarineQuest2"
                NameMon = "Chief Petty Officer"
                CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            elseif MyLevel == 150 or MyLevel <= 174 then
                Mon = "Sky Bandit [Lv. 150]"
                LevelQuest = 1
                NameQuest = "SkyQuest"
                NameMon = "Sky Bandit"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            elseif MyLevel == 175 or MyLevel <= 189 then
                Mon = "Dark Master [Lv. 175]"
                LevelQuest = 2
                NameQuest = "SkyQuest"
                NameMon = "Dark Master"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            elseif MyLevel == 190 or MyLevel <= 209 then
                Mon = "Prisoner [Lv. 190]"
                LevelQuest = 1
                NameQuest = "PrisonerQuest"
                NameMon = "Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            elseif MyLevel == 210 or MyLevel <= 249 then
                Mon = "Dangerous Prisoner [Lv. 210]"
                LevelQuest = 2
                NameQuest = "PrisonerQuest"
                NameMon = "Dangerous Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            elseif MyLevel == 250 or MyLevel <= 274 then
                Mon = "Toga Warrior [Lv. 250]"
                LevelQuest = 1
                NameQuest = "ColosseumQuest"
                NameMon = "Toga Warrior"
                CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            elseif MyLevel == 275 or MyLevel <= 299 then
                Mon = "Gladiator [Lv. 275]"
                LevelQuest = 2
                NameQuest = "ColosseumQuest"
                NameMon = "Gladiator"
                CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            elseif MyLevel == 300 or MyLevel <= 324 then
                Mon = "Military Soldier [Lv. 300]"
                LevelQuest = 1
                NameQuest = "MagmaQuest"
                NameMon = "Military Soldier"
                CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            elseif MyLevel == 325 or MyLevel <= 374 then
                Mon = "Military Spy [Lv. 325]"
                LevelQuest = 2
                NameQuest = "MagmaQuest"
                NameMon = "Military Spy"
                CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            elseif MyLevel == 375 or MyLevel <= 399 then
                Mon = "Fishman Warrior [Lv. 375]"
                LevelQuest = 1
                NameQuest = "FishmanQuest"
                NameMon = "Fishman Warrior"
                CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end
            elseif MyLevel == 400 or MyLevel <= 449 then
                Mon = "Fishman Commando [Lv. 400]"
                LevelQuest = 2
                NameQuest = "FishmanQuest"
                NameMon = "Fishman Commando"
                CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end
            elseif MyLevel == 450 or MyLevel <= 474 then
                Mon = "God's Guard [Lv. 450]"
                LevelQuest = 1
                NameQuest = "SkyExp1Quest"
                NameMon = "God's Guard"
                CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
                end
            elseif MyLevel == 475 or MyLevel <= 524 then
                Mon = "Shanda [Lv. 475]"
                LevelQuest = 2
                NameQuest = "SkyExp1Quest"
                NameMon = "Shanda"
                CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                end
            elseif MyLevel == 525 or MyLevel <= 549 then
                Mon = "Royal Squad [Lv. 525]"
                LevelQuest = 1
                NameQuest = "SkyExp2Quest"
                NameMon = "Royal Squad"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            elseif MyLevel == 550 or MyLevel <= 624 then
                Mon = "Royal Soldier [Lv. 550]"
                LevelQuest = 2
                NameQuest = "SkyExp2Quest"
                NameMon = "Royal Soldier"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            elseif MyLevel == 625 or MyLevel <= 649 then
                Mon = "Galley Pirate [Lv. 625]"
                LevelQuest = 1
                NameQuest = "FountainQuest"
                NameMon = "Galley Pirate"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            elseif MyLevel >= 650 then
                Mon = "Galley Captain [Lv. 650]"
                LevelQuest = 2
                NameQuest = "FountainQuest"
                NameMon = "Galley Captain"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            end
        elseif World2 then
            if MyLevel == 700 or MyLevel <= 724 then
                Mon = "Raider [Lv. 700]"
                LevelQuest = 1
                NameQuest = "Area1Quest"
                NameMon = "Raider"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            elseif MyLevel == 725 or MyLevel <= 774 then
                Mon = "Mercenary [Lv. 725]"
                LevelQuest = 2
                NameQuest = "Area1Quest"
                NameMon = "Mercenary"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            elseif MyLevel == 775 or MyLevel <= 799 then
                Mon = "Swan Pirate [Lv. 775]"
                LevelQuest = 1
                NameQuest = "Area2Quest"
                NameMon = "Swan Pirate"
                CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
            elseif MyLevel == 800 or MyLevel <= 874 then
                Mon = "Factory Staff [Lv. 800]"
                NameQuest = "Area2Quest"
                LevelQuest = 2
                NameMon = "Factory Staff"
                CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
            elseif MyLevel == 875 or MyLevel <= 899 then
                Mon = "Marine Lieutenant [Lv. 875]"
                LevelQuest = 1
                NameQuest = "MarineQuest3"
                NameMon = "Marine Lieutenant"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            elseif MyLevel == 900 or MyLevel <= 949 then
                Mon = "Marine Captain [Lv. 900]"
                LevelQuest = 2
                NameQuest = "MarineQuest3"
                NameMon = "Marine Captain"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            elseif MyLevel == 950 or MyLevel <= 974 then
                Mon = "Zombie [Lv. 950]"
                LevelQuest = 1
                NameQuest = "ZombieQuest"
                NameMon = "Zombie"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            elseif MyLevel == 975 or MyLevel <= 999 then
                Mon = "Vampire [Lv. 975]"
                LevelQuest = 2
                NameQuest = "ZombieQuest"
                NameMon = "Vampire"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            elseif MyLevel == 1000 or MyLevel <= 1049 then
                Mon = "Snow Trooper [Lv. 1000]"
                LevelQuest = 1
                NameQuest = "SnowMountainQuest"
                NameMon = "Snow Trooper"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            elseif MyLevel == 1050 or MyLevel <= 1099 then
                Mon = "Winter Warrior [Lv. 1050]"
                LevelQuest = 2
                NameQuest = "SnowMountainQuest"
                NameMon = "Winter Warrior"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            elseif MyLevel == 1100 or MyLevel <= 1124 then
                Mon = "Lab Subordinate [Lv. 1100]"
                LevelQuest = 1
                NameQuest = "IceSideQuest"
                NameMon = "Lab Subordinate"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            elseif MyLevel == 1125 or MyLevel <= 1174 then
                Mon = "Horned Warrior [Lv. 1125]"
                LevelQuest = 2
                NameQuest = "IceSideQuest"
                NameMon = "Horned Warrior"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            elseif MyLevel == 1175 or MyLevel <= 1199 then
                Mon = "Magma Ninja [Lv. 1175]"
                LevelQuest = 1
                NameQuest = "FireSideQuest"
                NameMon = "Magma Ninja"
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            elseif MyLevel == 1200 or MyLevel <= 1249 then
                Mon = "Lava Pirate [Lv. 1200]"
                LevelQuest = 2
                NameQuest = "FireSideQuest"
                NameMon = "Lava Pirate"
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            elseif MyLevel == 1250 or MyLevel <= 1274 then
                Mon = "Ship Deckhand [Lv. 1250]"
                LevelQuest = 1
                NameQuest = "ShipQuest1"
                NameMon = "Ship Deckhand"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif MyLevel == 1275 or MyLevel <= 1299 then
                Mon = "Ship Engineer [Lv. 1275]"
                LevelQuest = 2
                NameQuest = "ShipQuest1"
                NameMon = "Ship Engineer"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)   
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end             
            elseif MyLevel == 1300 or MyLevel <= 1324 then
                Mon = "Ship Steward [Lv. 1300]"
                LevelQuest = 1
                NameQuest = "ShipQuest2"
                NameMon = "Ship Steward"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)         
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif MyLevel == 1325 or MyLevel <= 1349 then
                Mon = "Ship Officer [Lv. 1325]"
                LevelQuest = 2
                NameQuest = "ShipQuest2"
                NameMon = "Ship Officer"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif MyLevel == 1350 or MyLevel <= 1374 then
                Mon = "Arctic Warrior [Lv. 1350]"
                LevelQuest = 1
                NameQuest = "FrostQuest"
                NameMon = "Arctic Warrior"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
                end
            elseif MyLevel == 1375 or MyLevel <= 1424 then
                Mon = "Snow Lurker [Lv. 1375]"
                LevelQuest = 2
                NameQuest = "FrostQuest"
                NameMon = "Snow Lurker"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            elseif MyLevel == 1425 or MyLevel <= 1449 then
                Mon = "Sea Soldier [Lv. 1425]"
                LevelQuest = 1
                NameQuest = "ForgottenQuest"
                NameMon = "Sea Soldier"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
            elseif MyLevel >= 1450 then
                Mon = "Water Fighter [Lv. 1450]"
                LevelQuest = 2
                NameQuest = "ForgottenQuest"
                NameMon = "Water Fighter"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
            end
        elseif World3 then
            if MyLevel == 1500 or MyLevel <= 1524 then
                Mon = "Pirate Millionaire [Lv. 1500]"
                LevelQuest = 1
                NameQuest = "PiratePortQuest"
                NameMon = "Pirate Millionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            elseif MyLevel == 1525 or MyLevel <= 1574 then
                Mon = "Pistol Billionaire [Lv. 1525]"
                LevelQuest = 2
                NameQuest = "PiratePortQuest"
                NameMon = "Pistol Billionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            elseif MyLevel == 1575 or MyLevel <= 1599 then
                Mon = "Dragon Crew Warrior [Lv. 1575]"
                LevelQuest = 1
                NameQuest = "AmazonQuest"
                NameMon = "Dragon Crew Warrior"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
            elseif MyLevel == 1600 or MyLevel <= 1624 then 
                Mon = "Dragon Crew Archer [Lv. 1600]"
                NameQuest = "AmazonQuest"
                LevelQuest = 2
                NameMon = "Dragon Crew Archer"
                CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            elseif MyLevel == 1625 or MyLevel <= 1649 then
                Mon = "Female Islander [Lv. 1625]"
                NameQuest = "AmazonQuest2"
                LevelQuest = 1
                NameMon = "Female Islander"
                CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            elseif MyLevel == 1650 or MyLevel <= 1699 then 
                Mon = "Giant Islander [Lv. 1650]"
                NameQuest = "AmazonQuest2"
                LevelQuest = 2
                NameMon = "Giant Islander"
                CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            elseif MyLevel == 1700 or MyLevel <= 1724 then
                Mon = "Marine Commodore [Lv. 1700]"
                LevelQuest = 1
                NameQuest = "MarineTreeIsland"
                NameMon = "Marine Commodore"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
            elseif MyLevel == 1725 or MyLevel <= 1774 then
                Mon = "Marine Rear Admiral [Lv. 1725]"
                NameMon = "Marine Rear Admiral"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 2
                CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            elseif MyLevel == 1775 or MyLevel <= 1799 then
                Mon = "Fishman Raider [Lv. 1775]"
                LevelQuest = 1
                NameQuest = "DeepForestIsland3"
                NameMon = "Fishman Raider"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            elseif MyLevel == 1800 or MyLevel <= 1824 then
                Mon = "Fishman Captain [Lv. 1800]"
                LevelQuest = 2
                NameQuest = "DeepForestIsland3"
                NameMon = "Fishman Captain"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            elseif MyLevel == 1825 or MyLevel <= 1849 then
                Mon = "Forest Pirate [Lv. 1825]"
                LevelQuest = 1
                NameQuest = "DeepForestIsland"
                NameMon = "Forest Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
            elseif MyLevel == 1850 or MyLevel <= 1899 then
                Mon = "Mythological Pirate [Lv. 1850]"
                LevelQuest = 2
                NameQuest = "DeepForestIsland"
                NameMon = "Mythological Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
            elseif MyLevel == 1900 or MyLevel <= 1924 then
                Mon = "Jungle Pirate [Lv. 1900]"
                LevelQuest = 1
                NameQuest = "DeepForestIsland2"
                NameMon = "Jungle Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            elseif MyLevel == 1925 or MyLevel <= 1974 then
                Mon = "Musketeer Pirate [Lv. 1925]"
                LevelQuest = 2
                NameQuest = "DeepForestIsland2"
                NameMon = "Musketeer Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            elseif MyLevel == 1975 or MyLevel <= 1999 then
                Mon = "Reborn Skeleton [Lv. 1975]"
                LevelQuest = 1
                NameQuest = "HauntedQuest1"
                NameMon = "Reborn Skeleton"
                CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            elseif MyLevel == 2000 or MyLevel <= 2024 then
                Mon = "Living Zombie [Lv. 2000]"
                LevelQuest = 2
                NameQuest = "HauntedQuest1"
                NameMon = "Living Zombie"
                CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            elseif MyLevel == 2025 or MyLevel <= 2049 then
                Mon = "Demonic Soul [Lv. 2025]"
                LevelQuest = 1
                NameQuest = "HauntedQuest2"
                NameMon = "Demonic Soul"
                CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
            elseif MyLevel == 2050 or MyLevel <= 2074 then
                Mon = "Posessed Mummy [Lv. 2050]"
                LevelQuest = 2
                NameQuest = "HauntedQuest2"
                NameMon = "Posessed Mummy"
                CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            elseif MyLevel == 2075 or MyLevel <= 2099 then
                Mon = "Peanut Scout [Lv. 2075]"
                LevelQuest = 1
                NameQuest = "NutsIslandQuest"
                NameMon = "Peanut Scout"
                CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            elseif MyLevel == 2100 or MyLevel <= 2124 then
                Mon = "Peanut President [Lv. 2100]"
                LevelQuest = 2
                NameQuest = "NutsIslandQuest"
                NameMon = "Peanut President"
                CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            elseif MyLevel == 2125 or MyLevel <= 2149 then
                Mon = "Ice Cream Chef [Lv. 2125]"
                LevelQuest = 1
                NameQuest = "IceCreamIslandQuest"
                NameMon = "Ice Cream Chef"
                CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            elseif MyLevel == 2150 or MyLevel <= 2199 then
                Mon = "Ice Cream Commander [Lv. 2150]"
                LevelQuest = 2
                NameQuest = "IceCreamIslandQuest"
                NameMon = "Ice Cream Commander"
                CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            elseif MyLevel == 2200 or MyLevel <= 2224 then
                Mon = "Cookie Crafter [Lv. 2200]"
                LevelQuest = 1
                NameQuest = "CakeQuest1"
                NameMon = "Cookie Crafter"
                CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            elseif MyLevel == 2225 or MyLevel <= 2249 then
                Mon = "Cake Guard [Lv. 2225]"
                LevelQuest = 2
                NameQuest = "CakeQuest1"
                NameMon = "Cake Guard"
                CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            elseif MyLevel == 2250 or MyLevel <= 2274 then
                Mon = "Baking Staff [Lv. 2250]"
                LevelQuest = 1
                NameQuest = "CakeQuest2"
                NameMon = "Baking Staff"
                CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            elseif MyLevel >= 2275 then
                Mon = "Head Baker [Lv. 2275]"
                LevelQuest = 2
                NameQuest = "CakeQuest2"
                NameMon = "Head Baker"
                CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            end
        end
    end
    
    function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport() 
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end                   
    
    function isnil(thing)
        return (thing == nil)
    end
    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end
    Number = math.random(1, 1000000)
    function UpdateEspPlayer()
        if ESPPlayer then
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if not isnil(v.Character) then
                    if not v.Character.Head:FindFirstChild('NameEsp'..v.Name) then
                        local BillboardGui = Instance.new("BillboardGui")
                        local ESP = Instance.new("TextLabel")
                        local HealthESP = Instance.new("TextLabel")
                        BillboardGui.Parent = v.Character.Head
                        BillboardGui.Name = 'NameEsp'..v.Name
                        BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        BillboardGui.Size = UDim2.new(1,200,1,30)
                        BillboardGui.Adornee = v.Character.Head
                        BillboardGui.AlwaysOnTop = true
                        ESP.Name = "ESP"
                        ESP.Parent = BillboardGui
                        ESP.TextTransparency = 0
                        ESP.BackgroundTransparency = 1
                        ESP.Size = UDim2.new(0, 200, 0, 30)
                        ESP.Position = UDim2.new(0,25,0,0)
                        ESP.Font = Enum.Font.Gotham
                        ESP.Text = (v.Name ..' '.."[ "..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M'.." ]")
                        if v.Team == game:GetService("Players").LocalPlayer.Team then
                            ESP.TextColor3 = Color3.new(0, 255, 255)
                        else
                            ESP.TextColor3 = Color3.new(255, 0, 0)
                        end
                        ESP.TextSize = 14
                        ESP.TextStrokeTransparency = 0.500
                        ESP.TextWrapped = true
                        HealthESP.Name = "HealthESP"
                        HealthESP.Parent = ESP
                        HealthESP.TextTransparency = 0
                        HealthESP.BackgroundTransparency = 1
                        HealthESP.Position = ESP.Position + UDim2.new(0, -25, 0, 15)
                        HealthESP.Size = UDim2.new(0, 200, 0, 30)
                        HealthESP.Font = Enum.Font.Gotham
                        HealthESP.TextColor3 = Color3.fromRGB(255, 0, 0)
                        HealthESP.TextSize = 14
                        HealthESP.TextStrokeTransparency = 0.500
                        HealthESP.TextWrapped = true
                        HealthESP.Text = "Health "..math.floor(v.Character.Humanoid.Health).."/"..math.floor(v.Character.Humanoid.MaxHealth)
                    else
                        v.Character.Head['NameEsp'..v.Name].ESP.Text = (v.Name ..' '..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                        v.Character.Head['NameEsp'..v.Name].ESP.HealthESP.Text = "Health "..math.floor(v.Character.Humanoid.Health).."/"..math.floor(v.Character.Humanoid.MaxHealth)
                        v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.TextTransparency = 0
                        v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.HealthESP.TextTransparency = 0
                    end
                end
            end
        else
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.Character.Head:FindFirstChild('NameEsp'..v.Name) then
                    v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.TextTransparency = 1
                    v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.HealthESP.TextTransparency = 1
                end
            end
        end     
    end
    
    function UpdateIslandESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if IslandESP then 
                    if v.Name ~= "Sea" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end
    
    function UpdateChestEsp() 
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            pcall(function()
                if string.find(v.Name,"Chest") then
                    if ChestESP then
                        if string.find(v.Name,"Chest") then
                            if not v:FindFirstChild('NameEsp'..Number) then
                                local bill = Instance.new('BillboardGui',v)
                                bill.Name = 'NameEsp'..Number
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1,200,1,30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new('TextLabel',bill)
                                name.Font = "GothamBold"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1,0,1,0)
                                name.TextYAlignment = 'Top'
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(0, 255, 250)
                            if v.Name == "Chest1" then
                                name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            end
                            if v.Name == "Chest2" then
                                name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            end
                        if v.Name == "Chest3" then
                            name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        end
                        else
                            v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp'..Number) then
                    v:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
                end
            end)
        end
    end
    
    function UpdateBfEsp() 
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            pcall(function()
                if DevilFruitESP then
                    if string.find(v.Name, "Fruit") then   
                        if not v.Handle:FindFirstChild('NameEsp'..Number) then
                            local bill = Instance.new('BillboardGui',v.Handle)
                            bill.Name = 'NameEsp'..Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v.Handle
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                            name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                        else
                            v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v.Handle:FindFirstChild('NameEsp'..Number) then
                        v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                        end
                end
            end)
        end
    end
    
    function UpdateFlowerEsp() 
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            pcall(function()
                if v.Name == "Flower2" or v.Name == "Flower1" then
                    if FlowerESP then 
                        if not v:FindFirstChild('NameEsp'..Number) then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'..Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if v.Name == "Flower1" then 
                            name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            name.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if v.Name == "Flower2" then
                            name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                    else
                        if v:FindFirstChild('NameEsp'..Number) then
                            v:FindFirstChild('NameEsp'..Number):Destroy()
                        end
                    end
                end   
            end)
        end
    end
    
    function InfAb()
        if InfAbility then
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
                local inf = Instance.new("ParticleEmitter")
                inf.Acceleration = Vector3.new(0,0,0)
                inf.Archivable = true
                inf.Drag = 20
                inf.EmissionDirection = Enum.NormalId.Top
                inf.Enabled = true
                inf.Lifetime = NumberRange.new(0.2,0.2)
                inf.LightInfluence = 0
                inf.LockedToPart = true
                inf.Name = "Agility"
                inf.Rate = 500
                local numberKeypoints2 = {
                    NumberSequenceKeypoint.new(0, 0);
                    NumberSequenceKeypoint.new(1, 4); 
                }
                inf.Size = NumberSequence.new(numberKeypoints2)
                inf.RotSpeed = NumberRange.new(999, 9999)
                inf.Rotation = NumberRange.new(0, 0)
                inf.Speed = NumberRange.new(30, 30)
                inf.SpreadAngle = Vector2.new(360,360)
                inf.Texture = "rbxassetid://7157487174"
                inf.VelocityInheritance = 0
                inf.ZOffset = 2
                inf.Transparency = NumberSequence.new(0)
                inf.Color = ColorSequence.new(Color3.fromRGB(80,245,245),Color3.fromRGB(80,245,245))
                inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            end
        else
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
            end
        end
    end
    
    local LocalPlayer = game:GetService'Players'.LocalPlayer
    local originalstam = LocalPlayer.Character.Energy.Value
    function infinitestam()
        LocalPlayer.Character.Energy.Changed:connect(function()
            if InfiniteEnergy then
                LocalPlayer.Character.Energy.Value = originalstam
            end 
        end)
    end
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if InfiniteEnergy then
                    wait(0.3)
                    originalstam = LocalPlayer.Character.Energy.Value
                    infinitestam()
                end
            end
        end)
    end)
    
    function NoDodgeCool()
        if nododgecool then
            for i,v in next, getgc() do
                if game:GetService("Players").LocalPlayer.Character.Dodge then
                    if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Dodge then
                        for i2,v2 in next, getupvalues(v) do
                            if tostring(v2) == "0.4" then
                            repeat wait(.1)
                                setupvalue(v,i2,0)
                            until not nododgecool
                            end
                        end
                    end
                end
            end
        end
    end
    
    function fly()
        local mouse=game:GetService("Players").LocalPlayer:GetMouse''
        localplayer=game:GetService("Players").LocalPlayer
        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        local speedSET=25
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                    wait()
                    localplayer.Character.Humanoid.PlatformStand=true
                    local new=gyro.CFrame - gyro.CFrame.p + pos.position
                    if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=1
                    end
                    if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed+speedSET
                    end
                    if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed+speedSET
                    end
                    if speed>speedSET then
                    speed=speedSET
                    end
                    pos.position=new.p
                    if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                    elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                    else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                    end
            until not Fly
            if gyro then 
                    gyro:Destroy() 
            end
            if pos then 
                    pos:Destroy() 
            end
            flying=false
            localplayer.Character.Humanoid.PlatformStand=false
            speed=0
        end
        e1=mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then 
                    flying=false e1:disconnect() e2:disconnect() return 
            end
            if key=="w" then
                keys.w=true
            elseif key=="s" then
                keys.s=true
            elseif key=="a" then
                keys.a=true
            elseif key=="d" then
                keys.d=true
            end
        end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
        start()
    end
    
    function Click()
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    
    function AutoHaki()
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
    
    function UnEquipWeapon(Weapon)
        if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
            _G.NotAutoEquip = true
            wait(.5)
            game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
            wait(.1)
            _G.NotAutoEquip = false
        end
    end
    
    function EquipWeapon(ToolSe)
        if not _G.NotAutoEquip then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                wait(.1)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
    end
    
    function topos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
        pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
        tween:Play()
        if Distance <= 250 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end
    
    function GetDistance(target)
        return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end
    
    function TP(Pos)
        Distance = (Pos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 250 then
            Speed = 600
        elseif Distance >= 1000 then
            Speed = 200
        end
        game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        ):Play()
        _G.Clip = true
        wait(Distance/Speed)
        _G.Clip = false
    end
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or FarmBoss or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone == true then
                    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        local Noclip = Instance.new("BodyVelocity")
                        Noclip.Name = "BodyClip"
                        Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        Noclip.MaxForce = Vector3.new(100000,100000,100000)
                        Noclip.Velocity = Vector3.new(0,0,0)
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone == true then
                    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone == true then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
                end)
            end    
        end
    end)
    
    function StopTween(target)
        if not target then
            _G.StopTween = true
            wait()
            topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
            _G.StopTween = false
            _G.Clip = false
        end
    end
    
    spawn(function()
        pcall(function()
            while wait() do
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                    if v:IsA("Tool") then
                        if v:FindFirstChild("RemoteFunctionShoot") then 
                            SelectWeaponGun = v.Name
                        end
                    end
                end
            end
        end)
    end)
    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    
    local ScreenGui = Instance.new("ScreenGui")
    local Toggle = Instance.new("TextButton")
    
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui
    
    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Toggle.Size = UDim2.new(0, 50, 0, 50)
    Toggle.Font = Enum.Font.Code
    Toggle.Text = "U"
    Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    Toggle.TextScaled = true
    Toggle.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
    end)
    --------------------------------------------------------------------
    local RenUi = library:AddWindow("UHB HUB",Enum.KeyCode.RightControl)
    --------------------------------------------------------------------
    local Main = RenUi:AddTab("ออโต้ฟาร์ม","6026568198")
    local Stats = RenUi:AddTab("สถิติ","7040410130")
    local Misc = RenUi:AddTab("อื่น ๆ","6034509993")
    --------------------------------------------------------------------
    Main:AddSeperator("")
    
    Time = Main:AddLabel("เวลา⏰")
    
    function UpdateTime()
        local GameTime = math.floor(workspace.DistributedGameTime+0.5)
        local Hour = math.floor(GameTime/(60^2))%24
        local Minute = math.floor(GameTime/(60^1))%60
        local Second = math.floor(GameTime/(60^0))%60
        Time:Set("Hr(s) : "..Hour.." Min(s) : "..Minute.." Sec(s) : "..Second)
    end
    
    spawn(function()
        while task.wait() do
            pcall(function()
                UpdateTime()
            end)
        end
    end)

    
    
    WeaponList = {}
    
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(WeaponList ,v.Name)
        end
    end
      Main:AddSeperator("Main1")
      
    local SelectWeapona = Main:AddDropdown("เลือกอาวุธ",WeaponList,function(value)
        _G.SelectWeapon = value
    end)
    
    Main:AddButton("รีเฟรชอาวุธ",function()
        SelectWeapona:Clear()
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
            SelectWeapona:Add(v.Name)
        end
    end)
   
    
    local AutoFarm = Main:AddToggle("ออโต้ฟาร์มเลเวล✅",_G.AutoFarm,function(value)
        _G.AutoFarm = value
        StopTween(_G.AutoFarm)
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoFarm then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        StartMagnet = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        StartMagnet = false
                        CheckQuest()
                        repeat wait() topos(CFrameQuest) until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoFarm
                        if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            wait(1.2)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                            wait(0.5)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        CheckQuest()
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()                                            
                                                PosMon = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                StartMagnet = true
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        else
                                            StartMagnet = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            StartMagnet = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                            else
                                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                                    if PosMon ~= nil then
                                        topos(PosMon * CFrame.new(5,10,7))
                                    else
                                        if OldPos ~= nil then
                                            topos(OldPos.Position)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    Main:AddToggle("บรินม็อบ✅",true,function(value)
        _G.BringMonster = value
    end)
     end)
    Main:AddToggle("ตีเร็ว✅",_G.FastAttack,function(value)
    _G.FastAttack = value
    end)
    spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.FastAttack then
            local Combat = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
            local Cemara = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
            Cemara.CameraShakeInstance.CameraShakeState = {FadingIn = 3, FadingOut = 2, Sustained = 0, Inactive = 1}
            Combat.activeController.timeToNextAttack = 0
            Combat.activeController.hitboxMagnitude = 150
            Combat.activeController.increment = 5
        end
    end)
end) 
end)
        if World2 then
        Main:AddToggle("ออโต้ตีโรงงาน✅",_G.AutoFactory,function(value)
            _G.AutoFactory = value
            StopTween(_G.AutoFactory)
        end)
    
        spawn(function()
            while wait() do
                pcall(function()
                    if _G.AutoFactory then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Core" and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()         
                                        EquipWeapon(_G.SelectWeapon)           
                                        topos(CFrame.new(448.46756, 199.356781, -441.389252))                                  
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until v.Humanoid.Health <= 0 or _G.AutoFactory == false
                                end
                            end
                        else
                            topos(CFrame.new(448.46756, 199.356781, -441.389252))
                        end
                    end
                end)
            end
        end)
    Main:AddSeperator("Main2")
    if World1 then
        Main:AddToggle("ออโต้โลก2✅",_G.AutoSecondSea,function(value)
            _G.AutoSecondSea = value
            StopTween(_G.AutoSecondSea)
        end)
    
        spawn(function()
            while wait() do 
                if _G.AutoSecondSea then
                    pcall(function()
                        local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
                        if MyLevel >= 700 and World1 then
                            if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                                local CFrame1 = CFrame.new(4849.29883, 5.65138149, 719.611877)
                                repeat topos(CFrame1) wait() until (CFrame1.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false
                                wait(1.1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                                wait(0.5)
                                EquipWeapon("Key")
                                repeat topos(CFrame.new(1347.7124, 37.3751602, -1325.6488)) wait() until (Vector3.new(1347.7124, 37.3751602, -1325.6488)-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false
                                wait(0.5)
                            else
                                if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                                if not v.Humanoid.Health <= 0 then
                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        OldCFrameSecond = v.HumanoidRootPart.CFrame
                                                        repeat task.wait()
                                                            AutoHaki()
                                                            EquipWeapon(_G.SelectWeapon)
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.Humanoid.WalkSpeed = 0
                                                            v.Head.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                            v.HumanoidRootPart.CFrame = OldCFrameSecond
                                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                                            game:GetService("VirtualUser"):CaptureController()
                                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                                        until not _G.AutoSecondSea or not v.Parent or v.Humanoid.Health <= 0
                                                    end
                                                else 
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                                end
                                            end
                                        end
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral [Lv. 700] [Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end
   
    

      
    Main:AddSeperator("Main3")
    
    Main:AddToggle("Auto Superhuman",_G.AutoSuperhuman,function(value)
        _G.AutoSuperhuman = value
    end)
    
    spawn(function()
        pcall(function()
            while wait() do 
                if _G.AutoSuperhuman then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 150000 then
                        UnEquipWeapon("Combat")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                    end   
                    if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                        _G.SelectWeapon = "Superhuman"
                    end  
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                            _G.SelectWeapon = "Black Leg"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                            _G.SelectWeapon = "Electro"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                            _G.SelectWeapon = "Fishman Karate"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                            _G.SelectWeapon = "Dragon Claw"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            UnEquipWeapon("Black Leg")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            UnEquipWeapon("Black Leg")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            UnEquipWeapon("Electro")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            UnEquipWeapon("Electro")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            UnEquipWeapon("Fishman Karate")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            UnEquipWeapon("Fishman Karate")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            UnEquipWeapon("Dragon Claw")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            UnEquipWeapon("Dragon Claw")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end 
                    end
                end
            end
        end)
    end)
    
    Main:AddToggle("Auto DeathStep",_G.AutoDeathStep,function(value)
        _G.AutoDeathStep = value
    end)
    
    spawn(function()
        while wait() do wait()
            if _G.AutoDeathStep then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        _G.SelectWeapon = "Death Step"
                    end  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        _G.SelectWeapon = "Death Step"
                    end  
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
                        _G.SelectWeapon = "Black Leg"
                    end 
                else 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                end
            end
        end
    end)
    
    Main:AddToggle("Auto Sharkman Karate",_G.AutoSharkman,function(value)
        _G.AutoSharkman = value
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoSharkman then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
                            topos(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                        else 
                            Ms = "Tide Keeper [Lv. 1475] [Boss]"
                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then   
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then    
                                        OldCFrameShark = v.HumanoidRootPart.CFrame
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.Head.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            v.HumanoidRootPart.CFrame = OldCFrameShark
                                            topos(v.HumanoidRootPart.CFrame*CFrame.new(5,10,7))
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSharkman == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                                    end
                                end
                            else
                                topos(CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202))
                                wait(3)
                            end
                        end
                    else 
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    end
                end
            end
        end)
    end)
    
    Main:AddToggle("Auto Electric Claw",_G.AutoElectricClaw,function(value)
        _G.AutoElectricClaw = value
        StopTween(_G.AutoElectricClaw)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do 
                if _G.AutoElectricClaw then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electric Claw") then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            _G.SelectWeapon = "Electric Claw"
                        end  
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            _G.SelectWeapon = "Electric Claw"
                        end  
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399 then
                            _G.SelectWeapon = "Electro"
                        end 
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                    end
                end
                if _G.AutoElectricClaw then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                            if _G.AutoFarm == false then
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                                wait(2)
                                repeat task.wait()
                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            elseif _G.AutoFarm == true then
                                _G.AutoFarm = false
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                                wait(2)
                                repeat task.wait()
                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                _G.SelectWeapon = "Electric Claw"
                                wait(.1)
                                _G.AutoFarm = true
                            end
                        end
                    end
                end
            end
        end)
    end)
    
    Main:AddToggle("Auto Dragon Talon",_G.AutoDragonTalon,function(value)
        _G.AutoDragonTalon = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoDragonTalon then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        _G.SelectWeapon = "Dragon Talon"
                    end  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        _G.SelectWeapon = "Dragon Talon"
                    end  
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 then
                        _G.SelectWeapon = "Dragon Claw"
                    end 
                else 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                end
            end
        end
    end)
    
    
    Main:AddToggle("Auto Evo Race",_G.Auto_EvoRace,function(value)
        _G.Auto_EvoRace = value
        StopTween(_G.Auto_EvoRace)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_EvoRace then
                    if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
                            topos(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                            if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.3)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
                            pcall(function()
                                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                    topos(game:GetService("Workspace").Flower1.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                    topos(game:GetService("Workspace").Flower2.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie [Lv. 950]") then
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Zombie [Lv. 950]" then
                                                repeat task.wait()
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                    PosMonEvo = v.HumanoidRootPart.CFrame
                                                    StartEvoMagnet = true
                                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_EvoRace == false
                                                StartEvoMagnet = false
                                            end
                                        end
                                    else
                                        StartEvoMagnet = false
                                        topos(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                                    end
                                end
                            end)
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                        end
                    end
                end
            end
        end)
    end)
    
    
    spawn(function()
        while task.wait() do
            pcall(function()
                if _G.BringMonster then
                    CheckQuest()
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.AutoFarm and StartMagnet and v.Name == Mon and (Mon == "Factory Staff [Lv. 800]" or Mon == "Monkey [Lv. 14]" or Mon == "Dragon Crew Warrior [Lv. 1575]" or Mon == "Dragon Crew Archer [Lv. 1600]") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 220 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        elseif _G.AutoFarm and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 275 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        end
                        if _G.AutoEctoplasm and StartEctoplasmMagnet then
                            if string.find(v.Name, "Ship") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - EctoplasmMon.Position).Magnitude <= 250 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.HumanoidRootPart.CFrame = EctoplasmMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoRengoku and StartRengokuMagnet then
                            if (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and (v.HumanoidRootPart.Position - RengokuMon.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = RengokuMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoMusketeerHat and StartMagnetMusketeerhat then
                            if v.Name == "Forest Pirate [Lv. 1825]" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = MusketeerHatMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.Auto_EvoRace and StartEvoMagnet then
                            if v.Name == "Zombie [Lv. 950]" and (v.HumanoidRootPart.Position - PosMonEvo.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonEvo
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoBartilo and AutoBartiloBring then
                            if v.Name == "Swan Pirate [Lv. 775]" and (v.HumanoidRootPart.Position - PosMonBarto.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonBarto
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoFarmFruitMastery and StartMasteryFruitMagnet then
                            if v.Name == "Monkey [Lv. 14]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == "Factory Staff [Lv. 800]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == Mon then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                        end
                        if _G.AutoFarmGunMastery and StartMasteryGunMagnet then
                            if v.Name == "Monkey [Lv. 14]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == "Factory Staff [Lv. 800]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == Mon then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                        end
                        if _G.Auto_Bone and StartMagnetBoneMon then
                            if (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonBone
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoDoughtBoss and MagnetDought then
                            if (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoCandy and StartMagnetCandy then
                            if (v.HumanoidRootPart.Position - PosMonCandy.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonCandy
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    
    Stats:AddSeperator("สถิติ")
    
    local Pointstat = Stats:AddLabel("สถานะ")
    
    spawn(function()
        while wait() do
            pcall(function()
                Pointstat:Set("Stat Points : "..tostring(game:GetService("Players")["LocalPlayer"].Data.Points.Value))
            end)
        end
    end)
    
    Stats:AddToggle("ระยะประชิด👊",_G.Auto_Melee,function(value)
        _G.Auto_Melee = value
    end)
    
    Stats:AddToggle("ป้องกัน❤️",_G.Auto_Defense,function(value)
        _G.Auto_Defense = value
    end)
    
    Stats:AddToggle("ดาบ⚔️",_G.Auto_Sword,function(value)
        _G.Auto_Sword = value
    end)
    
    Stats:AddToggle("ปืน🔫",_G.Auto_Gun,function(value)
        _G.Auto_Gun = value
    end)
    
    Stats:AddToggle("ผล🍎",_G.Auto_DevilFruit,function(value)
        _G.Auto_DevilFruit = value
    end)
    
    _G.PointStats = 1
    Stats:AddSlider("เลือกจุด",1,100,1,function(value)
        _G.PointStats = value
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Melee then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",_G.PointStats)
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Defense then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",_G.PointStats)
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Sword then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",_G.PointStats)
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Gun then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",_G.PointStats)
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_DevilFruit then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Devil Fruit",_G.PointStats)
                    end
                end
            end)
        end
    end)
    
    
   
    Misc:AddButton("Buy Geppo",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
    end)
    
    Misc:AddButton("Buy Buso Haki",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
    end)
    
    Misc:AddButton("Buy Soru",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end)
    
    Misc:AddButton("Buy Observation(Ken) Haki",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
    end)
    
    Misc:AddSeperator("Fighting Style")
    
    Misc:AddButton("Buy Black Leg",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end)
    
    Misc:AddButton("Buy Electro",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end)
    
    Misc:AddButton("Buy Fishman Karate",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end)
    
    Misc:AddButton("Buy Dragon Claw",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    end)
    
    Misc:AddButton("Buy Superhuman",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end)
    
    Misc:AddButton("Buy Death Step",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end)
    
    Misc:AddButton("Buy Sharkman Karate",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end)
    
    Misc:AddButton("Buy Electric Claw",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end)
    
    Misc:AddButton("Buy Dragon Talon",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end)
    
    Misc:AddSeperator("")
    

    
    Misc:AddButton("เปิดร้านปีศาจ",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
    end)
    

    
    Misc:AddSeperator("ทีม")
    
    Misc:AddButton("โจรสลัด💀",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
    end)
    
    Misc:AddButton("ทหารเรือ⛵",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines") 
    end)
    
    Misc:AddSeperator("")
    
    Misc:AddButton("ภาพกากๆ",function()
        pcall(function()
            game:GetService("Lighting").FantasySky:Destroy()
            local g = game
            local w = g.Workspace
            local l = g.Lighting
            local t = w.Terrain
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0
            l.GlobalShadows = false
            l.FogEnd = 9e9
            l.Brightness = 0
            settings().Rendering.QualityLevel = "Level01"
            for i, v in pairs(g:GetDescendants()) do
                if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
                    v.Material = "Plastic"
                    v.Reflectance = 0
                elseif v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Lifetime = NumberRange.new(0)
                elseif v:IsA("Explosion") then
                    v.BlastPressure = 1
                    v.BlastRadius = 1
                elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                    v.Enabled = false
                elseif v:IsA("MeshPart") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                    v.TextureID = 10385902758728957
                end
            end
            for i, e in pairs(l:GetChildren()) do
                if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                    e.Enabled = false
                end
            end
            for i, v in pairs(game:GetService("Workspace").Camera:GetDescendants()) do
                if v.Name == ("Water;") then
                    v.Transparency = 1
                    v.Material = "Plastic"
                end
            end
        end)
    end)

    
    Misc:AddSeperator("ESP")
    
    Misc:AddToggle("ESP Player🧒",false,function(value)
        ESPPlayer = value
        while ESPPlayer do wait()
            UpdateEspPlayer()
        end
    end)
    
    
    
    Misc:AddToggle("ESP Fruit🍎",false,function(value)
        DevilFruitESP = value
        while DevilFruitESP do wait()
            UpdateBfEsp() 
        end
    end)
    
    
    
    Misc:AddSeperator("")
    
    
    Misc:AddToggle("วิ่งเร็ว🏃",false,function(value)
        InfAbility = value
        if value == false then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
    end)
    
    spawn(function()
        while wait() do
            if InfAbility then
                InfAb()
            end
        end
    end)
    
    
elseif game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or game.PlaceId == 5931540094 or game.PlaceId == 5931540094 then
    _G.Color = Color3.fromRGB(255,0,0)
    if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
    
    repeat wait() until game:GetService("Players")
    
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end
        
    wait(1)
    
    do
        local ui = game.CoreGui:FindFirstChild("UlLib")
        if ui then
            ui:Destroy()
        end
    end
    
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    
    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil
    
        local function Update(input)
            local Delta = input.Position - DragStart
            local pos =
                UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset + Delta.X,
                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset + Delta.Y
                )
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
            Tween:Play()
        end
    
        topbarobject.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    DragStart = input.Position
                    StartPosition = object.Position
    
                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                            end
                        end
                    )
                end
            end
        )
    
        topbarobject.InputChanged:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
                then
                    DragInput = input
                end
            end
        )
    
        UserInputService.InputChanged:Connect(
            function(input)
                if input == DragInput and Dragging then
                    Update(input)
                end
            end
        )
    end
    
    local library = {}
    
    function library:AddWindow(text,keybind)
        local bind = keybind or Enum.KeyCode.RightControl
        local ff = false
        local currenttab = ""
    
        local DoctorShiba = Instance.new("ScreenGui")
        DoctorShiba.Name = "UlLib"
        DoctorShiba.Parent = game.CoreGui
        DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = DoctorShiba
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
        Main.BackgroundTransparency = 0.100
        Main.BorderSizePixel = 0
        Main.ClipsDescendants = true
        Main.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
        Main.Size = UDim2.new(0, 600, 0, 350)
    
        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Top.BackgroundTransparency = 1.000
        Top.BorderSizePixel = 0
        Top.Size = UDim2.new(0, 600, 0, 20)
    
        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Main
        Page.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
        Page.BackgroundTransparency = 0.100
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(0, 125, 0, 350)
    
        local NameHub = Instance.new("TextLabel")
        NameHub.Name = "NameHub"
        NameHub.Parent = Page
        NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameHub.BackgroundTransparency = 1.000
        NameHub.Position = UDim2.new(0.113333493, 0, 0, 0)
        NameHub.Size = UDim2.new(0, 110, 0, 20)
        NameHub.Font = Enum.Font.GothamSemibold
        NameHub.Text = text
        NameHub.TextColor3 = Color3.fromRGB(225, 0, 0)
        NameHub.TextSize = 11.000
        NameHub.TextXAlignment = Enum.TextXAlignment.Left
    
        local User = Instance.new("Frame")
        User.Name = "User"
        User.Parent = Page
        User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        User.BackgroundTransparency = 1.000
        User.Position = UDim2.new(0, 0, 0.8, 30)
        User.Size = UDim2.new(0, 125, 0, 40)
    
        local UserText = Instance.new("TextLabel")
        UserText.Name = "UserText"
        UserText.Parent = User
        UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        UserText.BackgroundTransparency = 1.000
        UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
        UserText.Size = UDim2.new(0, 80, 0, 20)
        UserText.Font = Enum.Font.Gotham
        UserText.Text = tostring(game.Players.LocalPlayer.Name) 
        spawn(function()
            while wait() do
                pcall(function()
                    wait(0.1) 
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 155, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 155, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 155)}
                    ):Play() 
                    wait(.5)
                end)
            end
        end)
        UserText.TextScaled = true
        UserText.TextSize = 11.000
        UserText.TextWrapped = true
        UserText.TextXAlignment = Enum.TextXAlignment.Left
    
        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint.Parent = UserText
        UITextSizeConstraint.MaxTextSize = 11
    
        local UserImage = Instance.new("ImageLabel")
        UserImage.Name = "UserImage"
        UserImage.Parent = User
        UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        UserImage.Position = UDim2.new(0, 10, 0, 9)
        UserImage.Size = UDim2.new(0, 25, 0, 25)
        UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"
    
        local UserImageCorner = Instance.new("UICorner")
        UserImageCorner.CornerRadius = UDim.new(0, 100)
        UserImageCorner.Name = "UserImageCorner"
        UserImageCorner.Parent = UserImage
    
        local ScrollPage = Instance.new("ScrollingFrame")
        ScrollPage.Name = "ScrollPage"
        ScrollPage.Parent = Page
        ScrollPage.Active = true
        ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollPage.BackgroundTransparency = 1.000
        ScrollPage.BorderSizePixel = 0
        ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
        ScrollPage.Size = UDim2.new(0, 125, 0, 290)
        ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollPage.ScrollBarThickness = 0
        local PageList = Instance.new("UIListLayout")
        PageList.Name = "PageList"
        PageList.Parent = ScrollPage
        PageList.SortOrder = Enum.SortOrder.LayoutOrder
        PageList.Padding = UDim.new(0, 7)
    
        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = ScrollPage
        PagePadding.PaddingTop = UDim.new(0, 5)
        PagePadding.PaddingLeft = UDim.new(0, 28)
    
        local TabFolder = Instance.new("Folder")
        TabFolder.Name = "TabFolder"
        TabFolder.Parent = Main
    
        MakeDraggable(Top,Main)
    
        local uihide = false
    
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == bind then
                if uihide == false then
                    uihide = true
                    Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.2,true)
                else
                    uihide = false
                    Main:TweenSize(UDim2.new(0, 600, 0, 350),"Out","Quad",0.2,true)
                end
            end
        end)
    
        local uitab = {}
    
        function uitab:AddTab(text,image)
            local Image = image or 6023426915
    
            local PageButton = Instance.new("TextButton")
            PageButton.Name = "PageButton"
            PageButton.Parent = ScrollPage
            PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageButton.BackgroundTransparency = 1.000
            PageButton.BorderSizePixel = 0
            PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
            PageButton.Size = UDim2.new(0, 97, 0, 20)
            PageButton.AutoButtonColor = false
            PageButton.Font = Enum.Font.GothamSemibold
            PageButton.Text = text
            PageButton.TextColor3 = Color3.fromRGB(225, 225, 225)
            PageButton.TextSize = 11.000
            PageButton.TextXAlignment = Enum.TextXAlignment.Left
            
            local PageImage = Instance.new("ImageLabel")
            PageImage.Name = "PageImage"
            PageImage.Parent = PageButton
            PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageImage.BackgroundTransparency = 1.000
            PageImage.Position = UDim2.new(0, -20, 0, 3)
            PageImage.Size = UDim2.new(0, 15, 0, 15)
            PageImage.Image = "rbxassetid://"..tostring(Image)
    
            local MainTab = Instance.new("Frame")
            MainTab.Name = "MainTab"
            MainTab.Parent = TabFolder
            MainTab.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            MainTab.BorderSizePixel = 0
            MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
            MainTab.Size = UDim2.new(0, 475, 0, 350)
            MainTab.Visible = false
    
            local ScrollTab = Instance.new("ScrollingFrame")
            ScrollTab.Name = "ScrollTab"
            ScrollTab.Parent = MainTab
            ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollTab.BackgroundTransparency = 1.000
            ScrollTab.BorderSizePixel = 0
            ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
            ScrollTab.Size = UDim2.new(0, 475, 0, 330)
            ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollTab.ScrollBarThickness = 3
    
            local TabList = Instance.new("UIListLayout")
            TabList.Name = "TabList"
            TabList.Parent = ScrollTab
            TabList.SortOrder = Enum.SortOrder.LayoutOrder
            TabList.Padding = UDim.new(0, 5)
    
            local TabPadding = Instance.new("UIPadding")
            TabPadding.Name = "TabPadding"
            TabPadding.Parent = ScrollTab
            TabPadding.PaddingLeft = UDim.new(0, 10)
            TabPadding.PaddingTop = UDim.new(0, 10)
    
            PageButton.MouseButton1Click:Connect(function()
                currenttab = MainTab.Name
                for i,v in next, TabFolder:GetChildren() do 
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                end
                MainTab.Visible = true
    
                for i,v in next, ScrollPage:GetChildren() do 
                    if v:IsA("TextButton") then
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(225, 225, 225)}
                        ):Play()
                    end
                    TweenService:Create(
                        PageButton,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end
            end)
    
            if ff == false then
                TweenService:Create(
                    PageButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,0,0)}
                ):Play()
                for i,v in next, TabFolder:GetChildren() do 
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                    MainTab.Visible = true
                end
                ff = true
            end
    
            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 10)
                    ScrollTab.CanvasSize = UDim2.new(0,0,0,TabList.AbsoluteContentSize.Y + 30)
                end)
            end)
            
            local main = {}
            
            function main:AddButton(text,callback)
                local Button = Instance.new("TextButton")
    
                Button.Name = "Button"
                Button.Parent = ScrollTab
                Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Button.BackgroundTransparency = 0.1
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0, 455, 0, 30)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Gotham
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(225, 225, 225)
                Button.TextSize = 11.000
                Button.TextWrapped = true
                
                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Parent = Button
                
                Button.MouseEnter:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
                
                Button.MouseLeave:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)
                
                Button.MouseButton1Click:Connect(function()
                    callback()
                    Button.TextSize = 0
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                        {TextSize = 11}
                    ):Play()
                end)
            end
            
            function main:AddToggle(text,config,callback)
                local ToggleImage = Instance.new("Frame")
                
                local Toggle = Instance.new("TextButton")
                Toggle.Name = "Toggle"
                Toggle.Parent = ScrollTab
                Toggle.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Toggle.BackgroundTransparency = 0.1
                Toggle.BorderSizePixel = 0
                Toggle.AutoButtonColor = false
                Toggle.Size = UDim2.new(0, 455, 0, 30)
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000
                
                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Parent = Toggle
    
                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Parent = Toggle
                ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleLabel.BackgroundTransparency = 1.000
                ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
                ToggleLabel.Size = UDim2.new(0, 410, 0, 30)
                ToggleLabel.Font = Enum.Font.Gotham
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                ToggleLabel.TextSize = 11.000
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Toggle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
                ToggleImage.Position = UDim2.new(0, 425, 0, 5)
                ToggleImage.BorderSizePixel = 0
                ToggleImage.Size = UDim2.new(0, 20, 0, 20)
                local ToggleImageCorner = Instance.new("UICorner")
                ToggleImageCorner.Name = "ToggleImageCorner"
                ToggleImageCorner.CornerRadius = UDim.new(0, 5)
                ToggleImageCorner.Parent = ToggleImage
    
                local ToggleImage2 = Instance.new("Frame")
                ToggleImage2.Name = "ToggleImage2"
                ToggleImage2.Parent = ToggleImage
                ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleImage2.BackgroundColor3 = Color3.fromRGB(255,0,0)
                ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
                ToggleImage2.Visible = false
    
                local ToggleImage2Corner = Instance.new("UICorner")
                ToggleImage2Corner.Name = "ToggleImageCorner"
                ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
                ToggleImage2Corner.Parent = ToggleImage2
                
                Toggle.MouseEnter:Connect(function()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
    
                Toggle.MouseLeave:Connect(function()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)
                if config == nil then config = false end
                local toggled = config or false
                Toggle.MouseButton1Click:Connect(function()
                    if toggled == false then
                        toggled = true
                        ToggleImage2.Visible = true
                        ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                    else
                        toggled = false
                        ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.1,true)
                        wait(0.1)
                        ToggleImage2.Visible = false
                    end
                    callback(toggled)
                end)
                
                if config == true then
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                    toggled = true
                    callback(toggled)
                end
            end
    
            function main:AddTextbox(text,holder,disappear,callback)
                local Textboxx = Instance.new("Frame")
                local TextboxxCorner = Instance.new("UICorner")
                local TextboxTitle = Instance.new("TextLabel")
                local Textbox = Instance.new("TextBox")
                local TextboxCorner = Instance.new("UICorner")
    
                Textboxx.Name = "Textboxx"
                Textboxx.Parent = ScrollTab
                Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Textboxx.Size = UDim2.new(0, 455, 0, 30)
    
                TextboxxCorner.CornerRadius = UDim.new(0, 5)
                TextboxxCorner.Name = "TextboxxCorner"
                TextboxxCorner.Parent = Textboxx
    
                TextboxTitle.Name = "TextboxTitle"
                TextboxTitle.Parent = Textboxx
                TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.BackgroundTransparency = 1.000
                TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
                TextboxTitle.Size = UDim2.new(0, 300, 0, 30)
                TextboxTitle.Font = Enum.Font.Gotham
                TextboxTitle.Text = text
                TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextboxTitle.TextSize = 11.000
                TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                Textbox.Name = "Textbox"
                Textbox.Parent = Textboxx
                Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Textbox.Position = UDim2.new(0, 310, 0, 5)
                Textbox.Size = UDim2.new(0, 140, 0, 20)
                Textbox.Font = Enum.Font.Gotham
                Textbox.Text = holder
                Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                Textbox.TextSize = 11.000
    
                Textbox.FocusLost:Connect(function()
                    if #Textbox.Text > 0 then
                        callback(Textbox.Text)
                    end
                    if disappear then
                        Textbox.Text = ""
                    else
                        Textbox.Text = holder
                    end
                end)
    
                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Parent = Textbox
            end
    
            function main:AddDropdown(text,table,callback)
                local Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropButton = Instance.new("TextButton")
                local Droptitle = Instance.new("TextLabel")
                local DropScroll = Instance.new("ScrollingFrame")
                local DropdownList = Instance.new("UIListLayout")
                local DropdownPadding = Instance.new("UIPadding")
                local DropImage = Instance.new("ImageLabel")
                
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = ScrollTab
                Dropdown.Active = true
                Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(0, 455, 0, 30)
                
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Dropdown
                
                DropButton.Name = "DropButton"
                DropButton.Parent = Dropdown
                DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton.BackgroundTransparency = 1.000
                DropButton.Size = UDim2.new(0, 455, 0, 30)
                DropButton.Font = Enum.Font.SourceSans
                DropButton.Text = ""
                DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropButton.TextSize = 14.000
                
                Droptitle.Name = "Droptitle"
                Droptitle.Parent = Dropdown
                Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Droptitle.BackgroundTransparency = 1.000
                Droptitle.Position = UDim2.new(0.0281690136, 0, 0, 0)
                Droptitle.Size = UDim2.new(0, 410, 0, 30)
                Droptitle.Font = Enum.Font.Gotham
                Droptitle.Text = text.." : "
                Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                Droptitle.TextSize = 11.000
                Droptitle.TextXAlignment = Enum.TextXAlignment.Left
    
                DropImage.Name = "DropImage"
                DropImage.Parent = Dropdown
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.Position = UDim2.new(0, 425, 0, 5)
                DropImage.Rotation = 0
                DropImage.Size = UDim2.new(0, 20, 0, 20)
                DropImage.Image = "rbxassetid://5012539403"
                
                DropScroll.Name = "DropScroll"
                DropScroll.Parent = Droptitle
                DropScroll.Active = true
                DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropScroll.BackgroundTransparency = 1.000
                DropScroll.BorderSizePixel = 0
                DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
                DropScroll.Size = UDim2.new(0, 455, 0, 70)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
                DropScroll.ScrollBarThickness = 2
                
                DropdownList.Name = "DropdownList"
                DropdownList.Parent = DropScroll
                DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownList.Padding = UDim.new(0, 5)
                
                DropdownPadding.Name = "DropdownPadding"
                DropdownPadding.Parent = DropScroll
                DropdownPadding.PaddingTop = UDim.new(0, 5)
    
                local isdropping = false
    
                for i,v in next,table do
                    local DropButton2 = Instance.new("TextButton")
    
                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(v)
    
                    DropButton2.MouseEnter:Connect(function()
                        TweenService:Create(
                            DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(255,0,0)}
                        ):Play()
                    end)
                    DropButton2.MouseLeave:Connect(function()
                        TweenService:Create(
                            DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(225, 225, 225)}
                        ):Play()
                    end)
    
                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        Droptitle.Text =  text.." : "..tostring(v)
                        callback(v)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
    
                DropButton.MouseButton1Click:Connect(function()
                    if isdropping == false then
                        isdropping = true
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 100)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = -180}
                        ):Play()
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    else
                        isdropping = false
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end
                end)
                DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
    
                local drop = {}
    
                function drop:Clear()
                    Droptitle.Text = tostring(text).." :"
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 455, 0, 30)} 
                    ):Play()
                    isdropping = false
                    for i, v in next, DropScroll:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end
                function drop:Add(t)
                    local DropButton2 = Instance.new("TextButton")
    
                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(t)
    
                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        Droptitle.Text =  text.." : "..tostring(t)
                        callback(t)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
                return drop
            end
    
            function main:AddSlider(text,min,max,set,callback)
                set = (math.clamp(set,min,max))
                if set > max then set = max end
    
                local Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local SliderTitle = Instance.new("TextLabel")
                local SliderValue = Instance.new("TextLabel")
                local SliderButton = Instance.new("TextButton")
                local Bar1 = Instance.new("Frame")
                local Bar = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local CircleBar = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UICorner_4 = Instance.new("UICorner")
    
                Slider.Name = "Slider"
                Slider.Parent = ScrollTab
                Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Slider.Size = UDim2.new(0, 455, 0, 40)
    
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Slider
    
                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0, 290, 0, 20)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderTitle.TextSize = 11.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                SliderValue.Name = "SliderValue"
                SliderValue.Parent = Slider
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(0.887778878, 0, 0, 0)
                SliderValue.Size = UDim2.new(0, 40, 0, 20)
                SliderValue.Font = Enum.Font.Gotham
                SliderValue.Text =  tostring(set and math.floor( (set / max) * (max - min) + min) or 0)
                SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderValue.TextSize = 11.000
    
                SliderButton.Name = "SliderButton"
                SliderButton.Parent = Slider
                SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderButton.BackgroundTransparency = 1.000
                SliderButton.Position = UDim2.new(0, 10, 0, 25)
                SliderButton.Size = UDim2.new(0, 435, 0, 5)
                SliderButton.AutoButtonColor = false
                SliderButton.Font = Enum.Font.SourceSans
                SliderButton.Text = ""
                SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderButton.TextSize = 14.000
    
                Bar1.Name = "Bar1"
                Bar1.Parent = SliderButton
                Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Bar1.Size = UDim2.new(0, 435, 0, 5)
    
                Bar.Name = "Bar"
                Bar.Parent = Bar1
                Bar.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Bar.Size = UDim2.new(set/max, 0, 0, 5)
    
                UICorner_2.CornerRadius = UDim.new(0, 100)
                UICorner_2.Parent = Bar
    
                CircleBar.Name = "CircleBar"
                CircleBar.Parent = Bar
                CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CircleBar.Position = UDim2.new(1, -2, 0, -2)
                CircleBar.AnchorPoint = Vector2.new(0, 0.1)
                CircleBar.Size = UDim2.new(0, 10, 0, 10)
    
                UICorner_3.CornerRadius = UDim.new(0, 100)
                UICorner_3.Parent = CircleBar
    
                UICorner_4.CornerRadius = UDim.new(0, 100)
                UICorner_4.Parent = Bar1
                
                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
    
                if Value == nil then
                    Value = set
                    pcall(function()
                        callback(Value)
                    end)
                end
                
                SliderButton.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    moveconnection = mouse.Move:Connect(function()
                        SliderValue.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                            CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        SliderValue.Text = Value
                    end
                end)
            end
            function main:AddSeperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local SepLabel = Instance.new("TextLabel")
                local Sep2 = Instance.new("Frame")
    
                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollTab
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.ClipsDescendants = true
                Seperator.Size = UDim2.new(0, 455, 0, 20)
    
                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 150, 0, 1)
    
                SepLabel.Name = "SepLabel"
                SepLabel.Parent = Seperator
                SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SepLabel.BackgroundTransparency = 1.000
                SepLabel.Position = UDim2.new(0, 95, 0, 0)
                SepLabel.Size = UDim2.new(0, 255, 0, 20)
                SepLabel.Font = Enum.Font.Gotham
                SepLabel.Text = text
                SepLabel.TextColor3 = Color3.fromRGB(225,225,225)
                SepLabel.TextSize = 11.000
    
                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep2.BorderSizePixel = 0
                Sep2.Position = UDim2.new(0, 305, 0, 10)
                Sep2.Size = UDim2.new(0, 150, 0, 1)
            end
            function main:AddLine()
                local Line = Instance.new("Frame")
                local Linee = Instance.new("Frame")
    
                Line.Name = "Line"
                Line.Parent = ScrollTab
                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Line.BackgroundTransparency = 1.000
                Line.ClipsDescendants = true
                Line.Size = UDim2.new(0, 455, 0, 20)
    
                Linee.Name = "Linee"
                Linee.Parent = Line
                Linee.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Linee.BorderSizePixel = 0
                Linee.Position = UDim2.new(0, 0, 0, 10)
                Linee.Size = UDim2.new(0, 455, 0, 1)
            end
            function main:AddLabel(text)
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}
        
                Label.Name = "Label"
                Label.Parent = ScrollTab
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 455, 0, 20)
                Label.Font = Enum.Font.Gotham
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 11.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left
    
                PaddingLabel.PaddingLeft = UDim.new(0,10)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"
        
                function labell:Set(newtext)
                    Label.Text = newtext
                end
    
                return labell
            end
            
            return main
        end
        return uitab
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    local Toggle = Instance.new("TextButton")
    
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui
    
    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Toggle.Size = UDim2.new(0, 50, 0, 50)
    Toggle.Font = Enum.Font.Code
    Toggle.Text = "R"
    Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    Toggle.TextScaled = true
    Toggle.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
    end)
    
    if game.PlaceId == 4520749081 then
       First_Sea = true
    elseif game.PlaceId == 6381829480 then
       Second_Sea = true
    elseif game.PlaceId == 5931540094 then
       Dungeon_Sea = true
    end
    function CheckQuest()
        QUEST = {}
        LVLREAL = {}
        local MyLevel = game.Players.LocalPlayer.PlayerStats.lvl.Value
        for i,v in pairs(game:GetService("Workspace").AntiTPNPC:GetChildren()) do 
            if string.find(v.Name,"QuestLvl") then
                table.insert(QUEST,v.Name)
            end
        end
        for i,v in pairs(game:GetService("ReplicatedStorage").MAP:GetChildren()) do 
            if string.find(v.Name,"QuestLvl") then
                table.insert(QUEST,v.Name)
            end
        end
        for i,v in pairs(QUEST) do
            values = v:split("QuestLvl")
            LVL = values[2]
            if MyLevel >= tonumber(LVL) then
                table.insert(LVLREAL,LVL)
            end
        end
        LevelQuest = math.max(unpack(LVLREAL))
    end
    
    function fly()
        local mouse=game.Players.LocalPlayer:GetMouse''
        localplayer=game.Players.LocalPlayer
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
        local speedSET=25
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                    wait()
                    localplayer.Character.Humanoid.PlatformStand=true
                    local new=gyro.CFrame - gyro.CFrame.p + pos.position
                    if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=1
                    end
                    if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed+speedSET
                    end
                    if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed+speedSET
                    end
                    if speed>speedSET then
                    speed=speedSET
                    end
                    pos.position=new.p
                    if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                    elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                    else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                    end
            until not Fly
            if gyro then 
                    gyro:Destroy() 
            end
            if pos then 
                    pos:Destroy() 
            end
            flying=false
            localplayer.Character.Humanoid.PlatformStand=false
            speed=0
        end
        e1=mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then 
                    flying=false e1:disconnect() e2:disconnect() return 
            end
            if key=="w" then
                keys.w=true
            elseif key=="s" then
                keys.s=true
            elseif key=="a" then
                keys.a=true
            elseif key=="d" then
                keys.d=true
            end
        end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
        start()
    end
    
    function isnil(thing)
        return (thing == nil)
    end
    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end
    Number = math.random(1, 1000000)
    function UpdateEspPlayer()
        if ESPPlayer then
            pcall(function()
                for i,v in pairs(game.Players:GetPlayers()) do
                    if not isnil(v.Character) then
                        if not v.Character.Head:FindFirstChild('NameEsp'..v.Name) then
                            local BillboardGui = Instance.new("BillboardGui")
                            local ESP = Instance.new("TextLabel")
                            local HealthESP = Instance.new("TextLabel")
                            BillboardGui.Parent = v.Character.Head
                            BillboardGui.Name = 'NameEsp'..v.Name
                            BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                            BillboardGui.Size = UDim2.new(1,200,1,30)
                            BillboardGui.Adornee = v.Character.Head
                            BillboardGui.AlwaysOnTop = true
                            ESP.Name = "ESP"
                            ESP.Parent = BillboardGui
                            ESP.TextTransparency = 0
                            ESP.BackgroundTransparency = 1
                            ESP.Size = UDim2.new(0, 200, 0, 30)
                            ESP.Position = UDim2.new(0,25,0,0)
                            ESP.Font = Enum.Font.Gotham
                            ESP.Text = (v.Name ..' '.."[ "..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M'.." ]")
                            ESP.TextColor3 = Color3.new(0, 255, 255)
                            ESP.TextSize = 14
                            ESP.TextStrokeTransparency = 0.500
                            ESP.TextWrapped = true
                            HealthESP.Name = "HealthESP"
                            HealthESP.Parent = ESP
                            HealthESP.TextTransparency = 0
                            HealthESP.BackgroundTransparency = 1
                            HealthESP.Position = ESP.Position + UDim2.new(0, -25, 0, 15)
                            HealthESP.Size = UDim2.new(0, 200, 0, 30)
                            HealthESP.Font = Enum.Font.Gotham
                            HealthESP.TextColor3 = Color3.fromRGB(80, 255, 245)
                            HealthESP.TextSize = 14
                            HealthESP.TextStrokeTransparency = 0.500
                            HealthESP.TextWrapped = true
                            HealthESP.Text = "Health "..math.floor(v.Character.Humanoid.Health).."/"..math.floor(v.Character.Humanoid.MaxHealth)
                        else
                            v.Character.Head['NameEsp'..v.Name].ESP.Text = (v.Name ..' '..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                            v.Character.Head['NameEsp'..v.Name].ESP.HealthESP.Text = "Health "..math.floor(v.Character.Humanoid.Health).."/"..math.floor(v.Character.Humanoid.MaxHealth)
                            v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.TextTransparency = 0
                            v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.HealthESP.TextTransparency = 0
                        end
                    end
                end
            end)
        else
            for i,v in pairs(game.Players:GetPlayers()) do
                if v.Character.Head:FindFirstChild('NameEsp'..v.Name) then
                    pcall(function()
                        v.Character.Head:FindFirstChild('NameEsp'..v.Name):Destroy()
                    end)
                end
            end
        end     
    end
    
    function UpdateBfEsp() 
        for i,v in pairs(game.Workspace:GetChildren()) do
            pcall(function()
                if DevilFruitESP then
                    if string.find(v.Name, "Fruit") then   
                        if not v.Handle:FindFirstChild('NameEsp'..Number) then
                            local bill = Instance.new('BillboardGui',v.Handle)
                            bill.Name = 'NameEsp'..Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v.Handle
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                            name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                        else
                            v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v.Handle:FindFirstChild('NameEsp'..Number) then
                        v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end)
        end
    end
    
    function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport() 
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end
    
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if _G.AutoGhostShip or _G.AutoSantaEvents or _G.AutoSecondSea or _G.AutoXmas or _G.AutoSeaking or _G.AutoBigMomBlade or _G.AutoBigMomBoss or _G.AutoKaido or _G.AutoSaber or _G.AutoKillply or _G.AutoFarm or _G.AutoBisento or _G.AutoFarmDungeon or _G.AutoKillply or _G.AutoEnma then
                if not game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    local Part = Instance.new("Part")
                    Part.Name = "TaiFoot"
                    Part.Parent = game.Workspace
                    Part.Anchored = true
                    Part.Transparency = 1
                    Part.Size = Vector3.new(30,0.5,30)
                elseif game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    game.Workspace["TaiFoot"].CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.92,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                end
            else
                if game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    game:GetService("Workspace"):FindFirstChild("TaiFoot"):Destroy()
                end
            end
        end)
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoGhostShip or _G.AutoSantaEvents or _G.AutoSecondSea or _G.AutoXmas or _G.AutoSeaking or _G.AutoBigMomBlade or _G.AutoBigMomBoss or _G.AutoKaido or _G.AutoSaber or _G.AutoKillply or _G.AutoFarm or _G.AutoBisento or _G.AutoFarmDungeon or _G.AutoKillply or _G.AutoEnma then
                pcall(function()
                    game:GetService("Players").LocalPlayer.Character.Services.Client.KenEvent:InvokeServer(true)
                end)
            end
        end
    end)
    
    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.AutoSantaEvents or _G.AutoSecondSea or _G.AutoXmas or _G.AutoSeaking or _G.AutoBigMomBlade or _G.AutoBigMomBoss or _G.AutoKaido or _G.AutoSaber or _G.AutoKillply or _G.AutoFarm or _G.AutoBisento or _G.AutoFarmDungeon or _G.AutoKillply or _G.AutoEnma or _G.NoClip then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)
    
    function UseSkill(skill)
        Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,skill,false,game)
        task.wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(false,skill,false,game)
    end
    
    function TP(pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end
    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    
    function EquipWeapon(ToolSe)
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            getgenv().tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait()
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
        end
    end
    
    function Click()
        game:GetService'VirtualUser':Button1Down(Vector2.new(0.9,0.9))
        game:GetService'VirtualUser':Button1Up(Vector2.new(0.9,0.9))
    end
    
    function StopNoClip(Config)
        if Config == false then
            if game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                game:GetService("Workspace"):FindFirstChild("TaiFoot"):Destroy()
            end
        end
    end
    
    function AutoHaki()
        pcall(function()
            if game.Players.LocalPlayer.Character.Haki.Value ~= 1 then
                game:GetService("Players").LocalPlayer.Character.Services.Client.Armament:FireServer()
                wait(1.5)
            end
        end)
    end
    --
    local RenUi = library:AddWindow("Ren Hub | KL",Enum.KeyCode.RightControl)
    --
    local Main = RenUi:AddTab("Auto Farm","6026568198")
    local Stats = RenUi:AddTab("Stats","7040410130")
    local Combat = RenUi:AddTab("Combat","7251993295")
    local Teleport = RenUi:AddTab("Teleport","7044226690")
    local Dungeon = RenUi:AddTab("Dungeon","7044284832")
    local Misc = RenUi:AddTab("Misc","6034900727")
    local Settings = RenUi:AddTab("Settings","6034509993")
    --
    Main:AddSeperator("Settings")
    
    Time = Main:AddLabel("Server Time")
    
    function UpdateTime()
        local GameTime = math.floor(workspace.DistributedGameTime+0.5)
        local Hour = math.floor(GameTime/(60^2))%24
        local Minute = math.floor(GameTime/(60^1))%60
        local Second = math.floor(GameTime/(60^0))%60
        Time:Set("Hr(s) : "..Hour.." Min(s) : "..Minute.." Sec(s) : "..Second)
    end
    
    spawn(function()
        while task.wait() do
            pcall(function()
                UpdateTime()
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TopbarPlus") then
                    game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TopbarPlus").Enabled = false
                end
            end)
        end
    end)
    
    Main:AddDropdown("Select Method",{"Behind","Below","Upper"},function(value)
        _G.Method = value
    end)
    
    spawn(function()
        while wait() do 
            pcall(function()
                if _G.Method == "Behind" then
                    MethodFarm = CFrame.new(0,0,_G.DistanceMob)
                elseif _G.Method == "Below" then
                    MethodFarm = CFrame.new(0,-_G.DistanceMob,0) * CFrame.Angles(math.rad(90),0,0)
                elseif _G.Method == "Upper" then
                    MethodFarm = CFrame.new(0,_G.DistanceMob,0)  * CFrame.Angles(math.rad(-90),0,0)
                else
                    MethodFarm = CFrame.new(0,0,_G.DistanceMob)
                end
            end)
        end
    end)
    
    _G.DistanceMob = 2
    Main:AddSlider("Distance",1,100,2,function(value)
        _G.DistanceMob = value
    end)
    
    Main:AddToggle("Auto Skill",_G.AutoSkill,function(value)
        _G.AutoSkill = value 
    end)
    
    Wapon = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Wapon,v.Name)
        end
    end
    
    local SelectWeapon = Main:AddDropdown("Select Weapon",Wapon,function(value)
        _G.SelectWeapon = value
    end)
    
    Main:AddButton("Refresh Weapon",function()
        SelectWeapon:Clear()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeapon:Add(v.Name)
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeapon:Add(v.Name)
            end
        end
    end)
    
    Main:AddSeperator("Main")
    
    Main:AddToggle("Auto Farm Level",_G.AutoFarm,function(value)
        _G.AutoFarm = value
        StopNoClip(_G.AutoFarm)
    end)
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local VirtualUser = game:GetService('VirtualUser')
    spawn(function()
        while wait() do
            if _G.AutoFarm then
                pcall(function()
                    CheckQuest()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == false then
                        if not game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl"..LevelQuest) then
                            TP(game:GetService("ReplicatedStorage").MAP["QuestLvl"..LevelQuest].HumanoidRootPart.CFrame * CFrame.new(0,0,-3))
                        else 
                            TP(game:GetService("Workspace").AntiTPNPC["QuestLvl"..LevelQuest].HumanoidRootPart.CFrame * CFrame.new(0,0,-3))
                        end
                        Click()
                        wait(.5)
                        for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                v.Accept.ImageTransparency = 1
                                game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == true then
                        Mon = string.sub(game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.QuestCount.Text,5,#game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.QuestCount.Text)
                        if game:GetService("Workspace").Monster.Mon:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
                                if v.Name == Mon then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            VirtualUser:CaptureController()
                                            VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                            TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                            if _G.AutoSkill then 
                                                UseSkill("Z")
                                                UseSkill("X")
                                                UseSkill("C")
                                                UseSkill("V")
                                            end
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoFarm == false or game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == false
                                    else
                                        UseSkill("E")
                                        if Second_Sea and game.Players.LocalPlayer.PlayerStats.lvl.Value >= 3275 then
                                            TP(CFrame.new(30272.3203125, 65.4236068725586, 93207.0234375))
                                        else
                                            if not game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl"..LevelQuest) then
                                                TP(game:GetService("ReplicatedStorage").MAP["QuestLvl"..LevelQuest].HumanoidRootPart.CFrame * CFrame.new(0,500,0))
                                            else 
                                                TP(game:GetService("Workspace").AntiTPNPC["QuestLvl"..LevelQuest].HumanoidRootPart.CFrame * CFrame.new(0,500,0))
                                            end
                                        end
                                    end
                                end
                            end
                        elseif game:GetService("Workspace").Monster.Boss:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                if v.Name == Mon then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            VirtualUser:CaptureController()
                                            VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                            TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                            if _G.AutoSkill then 
                                                UseSkill("Z")
                                                UseSkill("X")
                                                UseSkill("C")
                                                UseSkill("V")
                                            end
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoFarm == false or game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == false
                                    else
                                        UseSkill("E")
                                        if Second_Sea and game.Players.LocalPlayer.PlayerStats.lvl.Value >= 3275 then
                                            TP(CFrame.new(30272.3203125, 65.4236068725586, 93207.0234375))
                                        else
                                            if not game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl"..LevelQuest) then
                                                TP(game:GetService("ReplicatedStorage").MAP["QuestLvl"..LevelQuest].HumanoidRootPart.CFrame * CFrame.new(0,500,0))
                                            else 
                                                TP(game:GetService("Workspace").AntiTPNPC["QuestLvl"..LevelQuest].HumanoidRootPart.CFrame * CFrame.new(0,500,0))
                                            end
                                        end
                                    end
                                end
                            end
                        else 
                            UseSkill("E")
                            if Second_Sea and game.Players.LocalPlayer.PlayerStats.lvl.Value >= 3275 then
                                TP(CFrame.new(30272.3203125, 65.4236068725586, 93207.0234375))
                            else
                                if not game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl"..LevelQuest) then
                                    TP(game:GetService("ReplicatedStorage").MAP["QuestLvl"..LevelQuest].HumanoidRootPart.CFrame * CFrame.new(0,500,0))
                                else 
                                    TP(game:GetService("Workspace").AntiTPNPC["QuestLvl"..LevelQuest].HumanoidRootPart.CFrame * CFrame.new(0,500,0))
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddToggle("Auto Second Sea",_G.AutoSecondSea,function(value)
        _G.AutoSecondSea = value
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoSecondSea and First_Sea then
                    if game.Players.LocalPlayer.PlayerStats.IsSecondSea == Yes then
                        TP(CFrame.new(1798.5653076171875, 16.172266006469727, -1475.4083251953125))
                        Click()
                        wait(.5)
                        for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                v.Accept.ImageTransparency = 1
                                game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                            end
                        end
                    else
                        if game.Players.LocalPlayer.PlayerStats.lvl.Value >= 1500 then
                            _G.AutoFarm = false
                            if game.Players.LocalPlayer.Character:FindFirstChild("Map") or game.Players.LocalPlayer.Backpack:FindFirstChild("Map") then
                                TP(CFrame.new(6806.78662109375, 211.32806396484375, 1077.6700439453125))
                                Click()
                                wait(.5)
                                for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                                    if v.Name == "Dialogue" then
                                        v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                        v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                        v.Accept.ImageTransparency = 1
                                        game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                                    end
                                end
                            else
                                if game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == false then
                                    TP(CFrame.new(6806.78662109375, 211.32806396484375, 1077.6700439453125))
                                    Click()
                                    wait(.5)
                                    for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                                        if v.Name == "Dialogue" then
                                            v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                            v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                            v.Accept.ImageTransparency = 1
                                            game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                                        end
                                    end
                                else
                                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("Seasoned Fishman [Lv. 2200]") then
                                        for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                            if v.Name == "Seasoned Fishman [Lv. 2200]" and v.Humanoid.Health > 0 then
                                                repeat task.wait()
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                                    if _G.AutoSkill then 
                                                        UseSkill("Z")
                                                        UseSkill("X")
                                                        UseSkill("C")
                                                        UseSkill("V")
                                                    end
                                                    VirtualUser:CaptureController()
                                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                                until v.Humanoid.Health <= 0 or not _G.AutoSecondSea or game.Players.LocalPlayer.Character:FindFirstChild("Map") or game.Players.LocalPlayer.Backpack:FindFirstChild("Map")
                                            end
                                        end
                                    else
                                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Seasoned Fishman [Lv. 2200]") then
                                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Seasoned Fishman [Lv. 2200]").HumanoidRootPart.CFrame * MethodFarm)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    Main:AddSeperator("Sea King")
    
    Main:AddToggle("Auto Sea King",_G.AutoSeaking,function(value)
        _G.AutoSeaking = value
        StopNoClip(_G.AutoSeaking)
    end)
    
    Main:AddToggle("Auto Sea King Hop",_G.AutoSeaking_Hop,function(value)
        _G.AutoSeaking_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoSeaking then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").SeaMonster:GetChildren()) do
                        if game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing") and v.Humanoid.Health > 0 then
                            if v.Name == "SeaKing" then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) - Vector3.new(0,25,0))
                                    if _G.AutoSkill then 
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoSeaking or not game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing")                       
                            end
                        else
                            if game:GetService("Workspace").Island:FindFirstChild("Legacy Island1") then
                                TP(game:GetService("Workspace").Island:FindFirstChild("Legacy Island1").ChestSpawner.CFrame * CFrame.new(0,0,2))
                            elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island2") then
                                TP(game:GetService("Workspace").Island:FindFirstChild("Legacy Island2").ChestSpawner.CFrame * CFrame.new(0,0,2))
                            elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island3") then
                                TP(game:GetService("Workspace").Island:FindFirstChild("Legacy Island3").ChestSpawner.CFrame * CFrame.new(0,0,2))
                            elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island4") then
                                TP(game:GetService("Workspace").Island:FindFirstChild("Legacy Island4").ChestSpawner.CFrame * CFrame.new(0,0,2))
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoSeaking and _G.AutoSeaking_Hop then
                pcall(function()
                    if not game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing") then
                        wait(3)
                        Hop()
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Saber")
    
    Main:AddToggle("Auto Saber",_G.AutoSaber,function(value)
        _G.AutoSaber = value
        StopNoClip(_G.AutoSaber)
    end)
    
    Main:AddToggle("Auto Saber Hop",_G.AutoSaber_Hop,function(value)
        _G.AutoSaber_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoSaber then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("Expert Swordman [Lv. 3000]") then
                        for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "Expert Swordman [Lv. 3000]" and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then 
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoSaber
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Expert Swordman [Lv. 3000]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Expert Swordman [Lv. 3000]").HumanoidRootPart.CFrame * MethodFarm)
                        else
                            if _G.AutoSaber_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Xmas")
    
    Main:AddToggle("Auto Xmas",_G.AutoXmas,function(value)
        _G.AutoXmas = value
        StopNoClip(_G.AutoXmas)
    end)
    
    Main:AddToggle("Auto Xmas Hop",_G.AutoXmas_Hop,function(value)
        _G.AutoXmas_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoXmas then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("Santa [Lv. 5000]") then
                        for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "Santa [Lv. 5000]" and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then 
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoXmas
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Santa [Lv. 5000]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Santa [Lv. 5000]").HumanoidRootPart.CFrame * MethodFarm)
                        else
                            if _G.AutoXmas_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Santa Events")
    
    Main:AddToggle("Auto Santa Events",_G.AutoSantaEvents,function(value)
        _G.AutoSantaEvents = value
        StopNoClip(_G.AutoSantaEvents)
    end)
    
    Main:AddToggle("Auto Santa Events Hop",_G.AutoSantaEvents_Hop,function(value)
        _G.AutoSantaEvents_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoSantaEvents then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("Kris Kringle [Lv. 10000]") then
                        for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "Kris Kringle [Lv. 10000]" and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then 
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoSantaEvents
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Kris Kringle [Lv. 10000]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Kris Kringle [Lv. 10000]").HumanoidRootPart.CFrame * MethodFarm)
                        else
                            if game.Players.LocalPlayer.Character:FindFirstChild("CandySanta") or game.Players.LocalPlayer.Backpack:FindFirstChild("CandySanta") then
                                EquipWeapon("CandySanta")
                                TP(CFrame.new(11059.3721, 60.9907608, 6062.66211, -0.545285046, -9.39939824e-08, -0.838250697, -6.01143739e-08, 1, -7.30264986e-08, 0.838250697, 1.0570659e-08, -0.545285046))
                            else
                                if _G.AutoSantaEvents_Hop then
                                    Hop()
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    --
    Main:AddSeperator("Ghost Ship")
    
    Main:AddToggle("Auto Ghost Ship",_G.AutoGhostShip,function(value)
        _G.AutoGhostShip = value
        StopNoClip(_G.AutoGhostShip)
    end)
    
    Main:AddToggle("Auto Ghost Ship Hop",_G.AutoGhostShip_Hop,function(value)
        _G.AutoGhostShip_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoGhostShip then
                pcall(function()
                    if game:GetService("Workspace").GhostMonster:FindFirstChild("Ghost Ship") then
                        for i,v in pairs(game:GetService("Workspace"):FindFirstChild("GhostMonster"):GetChildren()) do
                            if v.Name == "Ghost Ship" and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                                    if _G.AutoSkill then 
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoGhostShip or not game:GetService("Workspace").GhostMonster:FindFirstChild("Ghost Ship")
                            end
                        end
                    else
                        if game:GetService("Workspace"):FindFirstChild("Chest1") then
                            TP(game:GetService("Workspace"):FindFirstChild("Chest1").HumanoidRootPart.CFrame)
                        elseif game:GetService("Workspace"):FindFirstChild("Chest2") then
                            TP(game:GetService("Workspace"):FindFirstChild("Chest2").HumanoidRootPart.CFrame)
                        elseif game:GetService("Workspace"):FindFirstChild("Chest3") then
                            TP(game:GetService("Workspace"):FindFirstChild("Chest3").HumanoidRootPart.CFrame)
                        else
                            if _G.AutoGhostShip_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Enma")
    
    Main:AddToggle("Auto Enma",_G.AutoEnma,function(value)
        _G.AutoEnma = value
        StopNoClip(_G.AutoEnma)
    end)
    
    Main:AddToggle("Auto Enma Hop",_G.AutoEnma_Hop,function(value)
        _G.AutoEnma_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoEnma then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("King Samurai [Lv. 3500]") then
                        for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "King Samurai [Lv. 3500]" and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then 
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoEnma
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("King Samurai [Lv. 3500]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("King Samurai [Lv. 3500]").HumanoidRootPart.CFrame * MethodFarm)
                        else
                            if _G.AutoEnma_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Big Mom Boss")
    
    Main:AddToggle("Auto Big Mom Boss",_G.AutoBigMomBoss,function(value)
        _G.AutoBigMomBoss = value
        StopNoClip(_G.AutoBigMomBoss)
    end)
    
    Main:AddToggle("Auto Big Mom Boss Hop",_G.AutoBigMomBoss_Hop,function(value)
        _G.AutoBigMomBoss_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoBigMomBoss then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("Ms. Mother [Lv.7500]") then
                        for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "Ms. Mother [Lv.7500]" and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then 
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoBigMomBoss
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Ms. Mother [Lv.7500]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Ms. Mother [Lv.7500]").HumanoidRootPart.CFrame * MethodFarm)
                        else 
                            if _G.AutoBigMomBoss_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Others")
    
    Main:AddToggle("Auto Big Mom Blade",_G.AutoBigMomBlade,function(value)
        _G.AutoBigMomBlade = value
        StopNoClip(_G.AutoBigMomBlade)
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoBigMomBlade then
                pcall(function()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Gem") or game.Players.LocalPlayer.Character:FindFirstChild("Gem") then
                        EquipWeapon("Gem")
                        TP(game:GetService("Workspace").Island["K - Zombie Island"].SummonAltar.Handle.CFrame)
                    elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Monster [Lv. 2500]") then
                        if game:GetService("Workspace").Monster.Boss:FindFirstChild("Monster [Lv. 2500]") then
                            for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                if v.Name == "Monster [Lv. 2500]" and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                        if _G.AutoSkill then 
                                            UseSkill("Z")
                                            UseSkill("X")
                                            UseSkill("C")
                                            UseSkill("V")
                                        end
                                        VirtualUser:CaptureController()
                                        VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                    until _G.AutoBigMomBlade == false or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Monster [Lv. 2500]") then
                                TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Monster [Lv. 2500]").HumanoidRootPart.CFrame * MethodFarm)
                            end
                        end
                    elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Shadow Master [Lv. 1600]") then
                        if game:GetService("Workspace").Monster.Boss:FindFirstChild("Shadow Master [Lv. 1600]") then
                            for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                if v.Name == "Shadow Master [Lv. 1600]" and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                        if _G.AutoSkill then 
                                            UseSkill("Z")
                                            UseSkill("X")
                                            UseSkill("C")
                                            UseSkill("V")
                                        end
                                        VirtualUser:CaptureController()
                                        VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                    until _G.AutoBigMomBlade == false or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Backpack:FindFirstChild("Gem") or game.Players.LocalPlayer.Character:FindFirstChild("Gem")
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Shadow Master [Lv. 1600]") then
                                TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Shadow Master [Lv. 1600]").HumanoidRootPart.CFrame * MethodFarm)
                            end
                        end
                    else
                        TP(CFrame.new(1452.2967529297, 39.12340927124, 6998.6513671875))
                    end
                end)
            end
        end
    end)
    
    Main:AddToggle("Auto Bisento",_G.AutoBisento,function(value)
        _G.AutoBisento = value
        StopNoClip(_G.AutoBisento)
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoBisento then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("Quake Woman [Lv. 1925]") then
                        for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "Quake Woman [Lv. 1925]" and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then 
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoBisento
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Quake Woman [Lv. 1925]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Quake Woman [Lv. 1925]").HumanoidRootPart.CFrame * MethodFarm)
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddToggle("Auto Kaido",_G.AutoKaido,function(value)
        _G.AutoKaido = value
        StopNoClip(_G.AutoKaido)
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoKaido then
                pcall(function()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Gem") or game.Players.LocalPlayer.Character:FindFirstChild("Gem") then
                        EquipWeapon("Gem")
                        TP(CFrame.new(1295.93237, 462.133698, 7368.77197, 0.945548892, -2.44059528e-08, 0.325480014, 3.26880851e-08, 1, -1.99773549e-08, -0.325480014, 2.95288842e-08, 0.945548892))
                    else
                        if game:GetService("Workspace").Monster.Boss:FindFirstChild("Dragon [Lv. 5000]") then
                            for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                if v.Name == "Dragon [Lv. 5000]" and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                        if _G.AutoSkill then 
                                            UseSkill("Z")
                                            UseSkill("X")
                                            UseSkill("C")
                                            UseSkill("V")
                                        end
                                        VirtualUser:CaptureController()
                                        VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                    until _G.AutoKaido == false or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Dragon [Lv. 5000]") then
                                TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Dragon [Lv. 5000]").HumanoidRootPart.CFrame * MethodFarm)
                            else
                                if game:GetService("Workspace").Monster.Boss:FindFirstChild("Elite Skeleton [Lv. 3100]") then
                                    for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                        if v.Name == "Elite Skeleton [Lv. 3100]" and v.Humanoid.Health > 0 then
                                            repeat task.wait()
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                                if _G.AutoSkill then 
                                                    UseSkill("Z")
                                                    UseSkill("X")
                                                    UseSkill("C")
                                                    UseSkill("V")
                                                end
                                                VirtualUser:CaptureController()
                                                VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                            until _G.AutoKaido == false or v.Humanoid.Health <= 0
                                        end
                                    end
                                else
                                    if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Elite Skeleton [Lv. 3100]") then
                                        TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Elite Skeleton [Lv. 3100]").HumanoidRootPart.CFrame * MethodFarm)
                                    else
                                        TP(CFrame.new(1295.93237, 462.133698, 7368.77197, 0.945548892, -2.44059528e-08, 0.325480014, 3.26880851e-08, 1, -1.99773549e-08, -0.325480014, 2.95288842e-08, 0.945548892))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Stats:AddSeperator("Auto Stats")
    
    Stats:AddToggle("Auto Defense",_G.AutoDefense,function(value)
        _G.AutoDefense = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoDefense then
                if game:GetService("Players")["LocalPlayer"].PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer("Defense",PointStats)
                    end)
                end
            end
        end
    end)
    
    Stats:AddToggle("Auto Melee",_G.AutoMelee,function(value)
        _G.AutoMelee = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoMelee then
                if game:GetService("Players")["LocalPlayer"].PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer("Melee",PointStats)
                    end)
                end
            end
        end
    end)
    
    Stats:AddToggle("Auto Sword",_G.AutoSword,function(value)
        _G.AutoSword = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoSword then
                if game:GetService("Players")["LocalPlayer"].PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer("Sword",PointStats)
                    end)
                end
            end
        end
    end)
    
    Stats:AddToggle("Auto Devil Fruit",_G.AutoDevilFruit,function(value)
        _G.AutoDevilFruit = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoDevilFruit then
                if game:GetService("Players")["LocalPlayer"].PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer("Devil Fruit",PointStats)
                    end)
                end
            end
        end
    end)
    
    Stats:AddSeperator("Settings")
    
    local PointLabel = Stats:AddLabel("Point")
    
    spawn(function()
        while wait() do
            pcall(function()
                PointLabel:Set("Points : "..game:GetService("Players")["LocalPlayer"].PlayerStats.Points.Value)
            end)
        end
    end)
    
    PointStats = 1
    Stats:AddSlider("Select Point",1,100,1,function(value)
        PointStats = value
    end)
    
    Combat:AddSeperator("Players")
    
    local plyserv = Combat:AddLabel("Players")
    
    spawn(function()
        while wait() do
            pcall(function()
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if i == 12 then
                        plyserv:Set("Players :".." "..i.." ".."/".." ".."12".." ".."(Max)")
                    elseif i == 1 then
                        plyserv:Set("Player :".." "..i.." ".."/".." ".."12")
                    else
                        plyserv:Set("Players :".." "..i.." ".."/".." ".."12")
                    end
                end
            end)
        end
    end)
    
    PlayerName = {}
    for i,v in pairs(game.Players:GetChildren()) do  
        if v.Name ~= game.Players.LocalPlayer.Name then
            table.insert(PlayerName ,v.Name)
        end
    end
    
    local SelectedPly = Combat:AddDropdown("Select Players",PlayerName,function(value)
        _G.SelectPly = value
    end)
    
    Combat:AddButton("Refresh Player",function()
        PlayerName = {}
        SelectedPly:Clear()
        for i,v in pairs(game.Players:GetChildren()) do  
            if v.Name ~= game.Players.LocalPlayer.Name then
                SelectedPly:Add(v.Name)
            end
        end
    end)
    
    Combat:AddToggle("Spectate Player",false,function(value)
        Spectate = value
        local plr1 = game.Players.LocalPlayer.Character.Humanoid
        local plr2 = game.Players:FindFirstChild(_G.SelectPly)
        repeat task.wait()
            game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
        until Spectate == false 
        game.Workspace.Camera.CameraSubject = plr1
    end)
    
    Combat:AddButton("Teleport",function()
        TP(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
    end)
    
    Combat:AddToggle("Auto Kill Player",false,function(value)
        _G.AutoKillply = value
        StopNoClip(_G.AutoKillply)
    end)
    spawn(function()
        while wait() do 
            pcall(function()
                if _G.AutoKillply then
                    if game.Players:FindFirstChild(_G.SelectPly) and game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                        repeat task.wait()
                            AutoHaki()
                            EquipWeapon(_G.SelectWeaponKill)
                            TP(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * MethodKill)
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or not _G.AutoKillply or not game.Players:FindFirstChild(_G.SelectPly)
                    end
                end
            end)
        end
    end)
    
    Combat:AddDropdown("Select Method",{"Behind","Below","Upper"},function(value)
        _G.Method2 = value
    end)
    
    spawn(function()
        while wait() do 
            pcall(function()
                if _G.Method2 == "Behind" then
                    MethodKill = CFrame.new(0,0,Distanceply)
                elseif _G.Method2 == "Below" then
                    MethodKill = CFrame.new(0,-Distanceply,0) * CFrame.Angles(math.rad(90),0,0)
                elseif _G.Method2 == "Upper" then
                    MethodKill = CFrame.new(0,Distanceply,0)  * CFrame.Angles(math.rad(-90),0,0)
                else
                    _G.Method2 = CFrame.new(0,0,Distanceply)
                end
            end)
        end
    end)
    
    Distanceply = 1
    Combat:AddSlider("Distance",1,100,1,function(value)
        Distanceply = value
    end)
    
    Weaponply = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Weaponply,v.Name)
        end
    end
    
    local SelectWeaponply = Combat:AddDropdown("Select Weapon",Weaponply,function(value)
        _G.SelectWeaponKill = value
    end)
    
    Combat:AddButton("Refresh Weapon",function()
        SelectWeaponply:Clear()
        Weaponply = {}
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeaponply:Add(v.Name)
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeaponply:Add(v.Name)
            end
        end
    end)
    
    Teleport:AddSeperator("MaP")
    
    if Second_Sea then
        Teleport:AddButton("Old Wolrd",function()
            TeleporttoOldWorld = true
        end)
        spawn(function()
            while wait() do
                if TeleporttoOldWorld then
                    pcall(function()
                        TP(CFrame.new(3947.696044921875, 16.74089813232422, 324.06292724609375))
                        Click()
                        wait(.5)
                        for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                v.Accept.ImageTransparency = 1
                                game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                            end
                        end
                    end)
                end
            end
        end)
    end
    
    if First_Sea then
        Teleport:AddButton("Second Sea",function()
            TeleporttoNewWorld = true
        end)
        spawn(function()
            while wait() do
                if TeleporttoNewWorld then
                    pcall(function()
                        TP(CFrame.new(1798.5653076171875, 16.172266006469727, -1475.4083251953125))
                        Click()
                        wait(.5)
                        for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                v.Accept.ImageTransparency = 1
                                game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                            end
                        end
                    end)
                end
            end
        end)
    end
    
    Teleport:AddSeperator("Island")
    
    if Second_Sea then
        Teleport:AddButton("Floresco",function()
               TP(CFrame.new(3709.0542, 56.4489174, 231.976654))
        end)
         Teleport:AddButton("Hibernus Land",function()
               TP(CFrame.new(2763.18311, 134.725479, -819.026123))
        end)
        Teleport:AddButton("Torrefacio",function()
               TP(CFrame.new(1779.29321, 56.12677, 1060.08374))
        end)
        Teleport:AddButton("Cercer",function()
               TP(CFrame.new(3017.57373, 29.2057247, 1378.00024))
        end)
        Teleport:AddButton("Skull lsland",function()
               TP(CFrame.new(1003.04968, 87.1491852, 6579.34277))
        end)
        Teleport:AddButton("Loaf lsland",function()
               TP(CFrame.new(6552.32617, 28.6099815, 7612.51514))
        end)
        Teleport:AddButton("Dead Thudra",function()
               TP(CFrame.new(8377.90527, 14.3858547, 969.619324))
        end)
        Teleport:AddButton("Santa Factory",function()
            TP(CFrame.new(10495.908203125, 61.35665512084961, 5763.68310546875))
        end)
    else
        Teleport:AddButton("Stone Rain Sea",function()
               TP(CFrame.new(6210.5903320312, 50.080966949463, -2050.3303222656))
        end)
        Teleport:AddButton("Town",function()
               TP(CFrame.new(2061.2985839844, 48.301433563232, -1572.8010253906))
        end)
         Teleport:AddButton("Pirate Island",function()
               TP(CFrame.new(3751.3720703125, 42.429008483887, -479.09103393555))
        end)
        Teleport:AddButton("Soldier Town",function()
               TP(CFrame.new(1734.4392089844, 68.61457824707, 233.17127990723))
        end)
        Teleport:AddButton("Shark Island",function()
               TP(CFrame.new(3507.51171875, 10.541933059692, 1499.6036376953))
        end)
        Teleport:AddButton("Chef Ship",function()
               TP(CFrame.new(32.638660430908, 149.17311096191, -37.506324768066))
        end)
        Teleport:AddButton("Snow Island",function()
               TP(CFrame.new(-1242.2866210938, 18.07179069519, 1587.9304199219))
        end)
        Teleport:AddButton("Desert Island",function()
               TP(CFrame.new(1536.3891601562, 12.834725379944, 2125.1857910156))
        end)
        Teleport:AddButton("Skyland",function()
               TP(CFrame.new(89.631294250488, 386.47360229492, 4216.4599609375))
        end)
        Teleport:AddButton("Bubbleland",function()
               TP(CFrame.new(5783.2954101562, 11.971294403076, 3483.4353027344))
        end)
        Teleport:AddButton("Stone Arena",function()
               TP(CFrame.new(9555.916015625, 37.722194671631, -3841.9360351562))
        end)
        Teleport:AddButton("War Island",function()
               TP(CFrame.new(6510.5747070312, 49.603099822998, 937.15655517578))
        end)
        Teleport:AddButton("Lobby Island",function()
               TP(CFrame.new(3032.4575195312, 13.059648513794, 5632.8969726562))
        end)
        Teleport:AddButton("Zombie Island",function()
               TP(CFrame.new(1641.8089599609, 26.438592910767, 6653.8837890625))
        end)
        Teleport:AddButton("Fishland",function()
               TP(CFrame.new(2412.5144042969, 40.273021697998, 9371.54296875))
        end)
    end
    
    Teleport:AddSeperator("SHOP")
    
    if First_Sea then
        Teleport:AddButton("Buso Shop",function()
            TP(CFrame.new(5841.32080078125, 12.240174293518066, 3603.513671875))
        end)
    elseif Second_Sea then
        Teleport:AddButton("Electro Shop",function()
            TP(CFrame.new(2462.47412109375, 173.04458618164062, -1099.1248779296875))
        end)
    end
    
    if First_Sea then
        Teleport:AddButton("Ken Shop",function()
            TP(CFrame.new(65.57159423828125, 386.49786376953125, 4064.0361328125))
        end)
    elseif Second_Sea then
        Teleport:AddButton("Dragon Claw Shop",function()
            TP(CFrame.new(2719.325927734375, 430.6570739746094, 721.2157592773438))
        end)
    end
    
    Teleport:AddButton("Black Leg Shop",function()
        if First_Sea then
            TP(CFrame.new(6457.87548828125, 168.47467041015625, -2376.072509765625))
        elseif Second_Sea then
            TP(CFrame.new(2367.072265625, 57.30705261230469, 135.1882781982422))
        end
    end)
    
    Teleport:AddButton("Cybrog Shop",function()
        if First_Sea then
            TP(CFrame.new(6457.87548828125, 168.47467041015625, -2376.072509765625))
        elseif Second_Sea then
            TP(CFrame.new(2325.837158203125, 57.26703643798828, 235.82777404785156))
        end
    end)
    
    Teleport:AddButton("Water Style Shop",function()
        if First_Sea then
            TP(CFrame.new(3944.12646484375, 123.67578125, 1489.2821044921875))
        elseif Second_Sea then
            TP(CFrame.new(2455.255859375, 57.30705261230469, 224.07823181152344))
        end
    end)
    
    if First_Sea then
        Teleport:AddButton("Sword Shop",function()
            TP(CFrame.new(2360.398681640625, 40.2966423034668, 9683.9658203125))
        end)
    elseif Second_Sea then
        Teleport:AddButton("ReStat Shop",function()
            TP(CFrame.new(2433.724609375, 57.30705261230469, 142.7527618408203))
        end)
    end
    
    Dungeon:AddSeperator("Dungeon")
    
    Dungeon:AddButton("Teleport to Dungeon",function()
        if First_Sea then
            TP(CFrame.new(6729.3916015625, 103.67321777344, 952.03881835938))
        elseif Second_Sea then
            TP(CFrame.new(2698.6772460938, 223.11566162109, 6.6630764007568))
        end
    end)
    
    if not Dungeon_Sea then
        Dungeon:AddLabel("In Dungeon Only!")
    end
    
    if Dungeon_Sea then
        Dungeon:AddToggle("Auto Farm Dungeon",_G.AutoFarmDungeon,function(value)
            _G.AutoFarmDungeon = value
        end)
    
        _G.SaveAt = 30
        Dungeon:AddSlider("Save At",1,100,30,function(value)
            _G.SaveAt = value
        end)
    
        DistanceDungeon = 2
        Dungeon:AddSlider("Distance",1,100,2,function(value)
            DistanceDungeon = value
        end)
    
        spawn(function()
            while wait() do
                if _G.AutoFarmDungeon then
                    if not _G.NotEquip then
                        pcall(function()
                            for i,v in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end)
                    end
                end
            end
        end)
    
        spawn(function()
            while wait() do
                pcall(function()
                    if _G.AutoFarmDungeon then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then 
                            AutoFarmMobDungeon = true
                            AutoSaveModeDungeon = false
                        else
                            AutoFarmMobDungeon = false
                            AutoSaveModeDungeon = true
                        end
                    end
                end)
            end
        end)
    
        spawn(function()
            while wait() do
                if _G.AutoFarmDungeon and AutoFarmMobDungeon then
                    pcall(function()
                        if game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then
                            for i,v in pairs(game:GetService("Workspace").MOB:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") then
                                    repeat task.wait()
                                        _G.NotEquip = false
                                        AutoHaki()
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,0,DistanceDungeon))
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    until v.Humanoid.Health <= 0 or not _G.AutoFarmDungeon or not AutoFarmMobDungeon or game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt
                                end
                            end
                        end
                    end)
                end
            end
        end)
        
        spawn(function()
            while wait() do
                if _G.AutoFarmDungeon and AutoSaveModeDungeon then
                    pcall(function()
                        if game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then                                                     
                            repeat task.wait()
                                _G.NotEquip = true
                                if game:GetService("Workspace").Island:FindFirstChild("Arena1") then
                                    TP(CFrame.new(-9.393295288085938, 201.8232879638672, 16.94792366027832))
                                else
                                    TP(CFrame.new(-19.639192581176758, 182.88330078125, 6.57674503326416))
                                end
                                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Combat" then
                                            EquipWeapon(v.Name)
                                        end
                                    end
                                end
                                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Combat" then
                                            EquipWeapon(v.Name)
                                        end
                                    end
                                end   
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            until game.Players.LocalPlayer.Character.Humanoid.Health == game.Players.LocalPlayer.Character.Humanoid.MaxHealth or not AutoSaveModeDungeon or not _G.AutoFarmDungeon
                            _G.NotEquip = false
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"E",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        end
                    end)
                end
            end
        end)
    end
    
    Misc:AddSeperator("Server")
    
    Misc:AddButton("Rejoin Server",function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end)
    
    Misc:AddButton("Server Hop",function()
        Hop()
    end)
    
    Misc:AddButton("Hop To Lower Player",function()
        getgenv().AutoTeleport = true
        getgenv().DontTeleportTheSameNumber = true 
        getgenv().CopytoClipboard = false
        if not game:IsLoaded() then
            print("Game is loading waiting...")
        end
        local maxplayers = math.huge
        local serversmaxplayer;
        local goodserver;
        local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" 
        function serversearch()
            for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
                if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                    serversmaxplayer = v.maxPlayers
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end       
        end
        function getservers()
            serversearch()
            for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
                if i == "nextPageCursor" then
                    if gamelink:find("&cursor=") then
                        local a = gamelink:find("&cursor=")
                        local b = gamelink:sub(a)
                        gamelink = gamelink:gsub(b, "")
                    end
                    gamelink = gamelink .. "&cursor=" ..v
                    getservers()
                end
            end
        end 
        getservers()
        if AutoTeleport then
            if DontTeleportTheSameNumber then 
                if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
                    return warn("It has same number of players (except you)")
                elseif goodserver == game.JobId then
                    return warn("Your current server is the most empty server atm") 
                end
            end
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
        end
    end)
    
    Misc:AddSeperator("Devil Fruits")
    
    Misc:AddToggle("Auto Random Fruit Beli",_G.AutoRandomFruitBeli,function(value)
        _G.AutoRandomFruitBeli = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoRandomFruitBeli then
                pcall(function()
                    if First_Sea then
                        TP(CFrame.new(2027.9697265625, 48.14053726196289, -1737.6326904296875))
                    elseif Second_Sea then
                        TP(CFrame.new(2362.600341796875, 57.83930969238281, 259.5265808105469))
                    end
                    wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer(workspace.AntiTPNPC.ARandomFruit)
                    if game:GetService("Players").LocalPlayer.PlayerGui.ARandomFruit.Dialogue.Beli.Visible == true then
                        Click()
                        wait(.1)
                        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Beli.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Beli.Position = UDim2.new(-2, 0, -5, 0)
                                v.Beli.ImageTransparency = 1
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Misc:AddToggle("Auto Random Fruit Gem",_G.AutoRandomFruitGem,function(value)
        _G.AutoRandomFruitGem = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoRandomFruitGem then
                pcall(function()
                    if First_Sea then
                        TP(CFrame.new(2027.9697265625, 48.14053726196289, -1737.6326904296875))
                    elseif Second_Sea then
                        TP(CFrame.new(2362.600341796875, 57.83930969238281, 259.5265808105469))
                    end
                    wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer(workspace.AntiTPNPC.ARandomFruit)
                    if game:GetService("Players").LocalPlayer.PlayerGui.ARandomFruit.Dialogue.Gem.Visible == true then
                        Click()
                        wait(.1)
                        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Gem.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Gem.Position = UDim2.new(-2, 0, -5, 0)
                                v.Gem.ImageTransparency = 1
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Misc:AddToggle("Bring Fruit",_G.BringFruit,function(value)
        _G.BringFruit = value
    end)
    
    spawn(function()
        while wait() do
            if _G.BringFruit then
                pcall(function()
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA("Tool") then
                            v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end	
                end)
            end
        end
    end)
    
    Misc:AddSeperator("Abilities")
    
    OldCanGeppo = game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value
    Misc:AddToggle("Inf Geppo",false,function(value)
        if value == true then
            game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value = 1000000000000000000
        elseif value == false then
            game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value = OldCanGeppo
        end
    end)
    
    Misc:AddToggle("Fly",false,function(value)
        Fly = value
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if Fly then
                    fly()
                end
            end)
        end
    end)
    
    Misc:AddToggle("No Clip",false,function(value)
        _G.NoClip = value
    end)
    
    Misc:AddSeperator("ESP")
    
    Misc:AddToggle("Player ESP",ESPPlayer,function(value)
        ESPPlayer = value
        while ESPPlayer do wait()
            UpdateEspPlayer()
        end
    end)
    
    Misc:AddToggle("Devil Fruit ESP",DevilFruitESP,function(value)
        DevilFruitESP = value
        while DevilFruitESP do wait()
            UpdateBfEsp() 
        end
    end)
    
    Settings:AddSeperator("Ui")
    
    Settings:AddButton("Destroy Ui",function()
        if game.CoreGui:FindFirstChild("UlLib") then
            game.CoreGui:FindFirstChild("UlLib"):Destroy()
        end
    end)
    
    Settings:AddTextbox("Level","",true,function(value)
        _G.LockAt = value
    end)
    
    Settings:AddToggle("Lock Level",_G.LockLevel,function(value)
        _G.LockLevel = value
    end)
    
    spawn(function()
        while wait() do 
            if _G.LockLevel then
                pcall(function()
                    if game.Players.LocalPlayer.PlayerStats.lvl.Value >= tonumber(_G.LockAt) then
                        game.Players.LocalPlayer:Kick("\nSuccessfully Farm!")
                    end
                end)
            end
        end
    end)
elseif game.PlaceId == 6329844902 then
    _G.Color = Color3.fromRGB(255,0,0)
    if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
    
    repeat wait() until game:GetService("Players")
    
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end
        
    wait(1)
    
    do
        local ui = game.CoreGui:FindFirstChild("UlLib")
        if ui then
            ui:Destroy()
        end
    end
    
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    
    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil
    
        local function Update(input)
            local Delta = input.Position - DragStart
            local pos =
                UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset + Delta.X,
                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset + Delta.Y
                )
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
            Tween:Play()
        end
    
        topbarobject.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    DragStart = input.Position
                    StartPosition = object.Position
    
                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                            end
                        end
                    )
                end
            end
        )
    
        topbarobject.InputChanged:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
                then
                    DragInput = input
                end
            end
        )
    
        UserInputService.InputChanged:Connect(
            function(input)
                if input == DragInput and Dragging then
                    Update(input)
                end
            end
        )
    end
    
    local library = {}
    
    function library:AddWindow(text,keybind)
        local bind = keybind or Enum.KeyCode.RightControl
        local ff = false
        local currenttab = ""
    
        local DoctorShiba = Instance.new("ScreenGui")
        DoctorShiba.Name = "UlLib"
        DoctorShiba.Parent = game.CoreGui
        DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = DoctorShiba
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
        Main.BackgroundTransparency = 0.100
        Main.BorderSizePixel = 0
        Main.ClipsDescendants = true
        Main.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
        Main.Size = UDim2.new(0, 600, 0, 350)
    
        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Top.BackgroundTransparency = 1.000
        Top.BorderSizePixel = 0
        Top.Size = UDim2.new(0, 600, 0, 20)
    
        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Main
        Page.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
        Page.BackgroundTransparency = 0.100
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(0, 125, 0, 350)
    
        local NameHub = Instance.new("TextLabel")
        NameHub.Name = "NameHub"
        NameHub.Parent = Page
        NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameHub.BackgroundTransparency = 1.000
        NameHub.Position = UDim2.new(0.113333493, 0, 0, 0)
        NameHub.Size = UDim2.new(0, 110, 0, 20)
        NameHub.Font = Enum.Font.GothamSemibold
        NameHub.Text = text
        NameHub.TextColor3 = Color3.fromRGB(225, 0, 0)
        NameHub.TextSize = 11.000
        NameHub.TextXAlignment = Enum.TextXAlignment.Left
    
        local User = Instance.new("Frame")
        User.Name = "User"
        User.Parent = Page
        User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        User.BackgroundTransparency = 1.000
        User.Position = UDim2.new(0, 0, 0.8, 30)
        User.Size = UDim2.new(0, 125, 0, 40)
    
        local UserText = Instance.new("TextLabel")
        UserText.Name = "UserText"
        UserText.Parent = User
        UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        UserText.BackgroundTransparency = 1.000
        UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
        UserText.Size = UDim2.new(0, 80, 0, 20)
        UserText.Font = Enum.Font.Gotham
        UserText.Text = tostring(game.Players.LocalPlayer.Name) 
        spawn(function()
            while wait() do
                pcall(function()
                    wait(0.1) 
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 155, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 155, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 155)}
                    ):Play() 
                    wait(.5)
                end)
            end
        end)
        UserText.TextScaled = true
        UserText.TextSize = 11.000
        UserText.TextWrapped = true
        UserText.TextXAlignment = Enum.TextXAlignment.Left
    
        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint.Parent = UserText
        UITextSizeConstraint.MaxTextSize = 11
    
        local UserImage = Instance.new("ImageLabel")
        UserImage.Name = "UserImage"
        UserImage.Parent = User
        UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        UserImage.Position = UDim2.new(0, 10, 0, 9)
        UserImage.Size = UDim2.new(0, 25, 0, 25)
        UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"
    
        local UserImageCorner = Instance.new("UICorner")
        UserImageCorner.CornerRadius = UDim.new(0, 100)
        UserImageCorner.Name = "UserImageCorner"
        UserImageCorner.Parent = UserImage
    
        local ScrollPage = Instance.new("ScrollingFrame")
        ScrollPage.Name = "ScrollPage"
        ScrollPage.Parent = Page
        ScrollPage.Active = true
        ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollPage.BackgroundTransparency = 1.000
        ScrollPage.BorderSizePixel = 0
        ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
        ScrollPage.Size = UDim2.new(0, 125, 0, 290)
        ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollPage.ScrollBarThickness = 0
        local PageList = Instance.new("UIListLayout")
        PageList.Name = "PageList"
        PageList.Parent = ScrollPage
        PageList.SortOrder = Enum.SortOrder.LayoutOrder
        PageList.Padding = UDim.new(0, 7)
    
        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = ScrollPage
        PagePadding.PaddingTop = UDim.new(0, 5)
        PagePadding.PaddingLeft = UDim.new(0, 28)
    
        local TabFolder = Instance.new("Folder")
        TabFolder.Name = "TabFolder"
        TabFolder.Parent = Main
    
        MakeDraggable(Top,Main)
    
        local uihide = false
    
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == bind then
                if uihide == false then
                    uihide = true
                    Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.2,true)
                else
                    uihide = false
                    Main:TweenSize(UDim2.new(0, 600, 0, 350),"Out","Quad",0.2,true)
                end
            end
        end)
    
        local uitab = {}
    
        function uitab:AddTab(text,image)
            local Image = image or 6023426915
    
            local PageButton = Instance.new("TextButton")
            PageButton.Name = "PageButton"
            PageButton.Parent = ScrollPage
            PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageButton.BackgroundTransparency = 1.000
            PageButton.BorderSizePixel = 0
            PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
            PageButton.Size = UDim2.new(0, 97, 0, 20)
            PageButton.AutoButtonColor = false
            PageButton.Font = Enum.Font.GothamSemibold
            PageButton.Text = text
            PageButton.TextColor3 = Color3.fromRGB(225, 225, 225)
            PageButton.TextSize = 11.000
            PageButton.TextXAlignment = Enum.TextXAlignment.Left
            
            local PageImage = Instance.new("ImageLabel")
            PageImage.Name = "PageImage"
            PageImage.Parent = PageButton
            PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageImage.BackgroundTransparency = 1.000
            PageImage.Position = UDim2.new(0, -20, 0, 3)
            PageImage.Size = UDim2.new(0, 15, 0, 15)
            PageImage.Image = "rbxassetid://"..tostring(Image)
    
            local MainTab = Instance.new("Frame")
            MainTab.Name = "MainTab"
            MainTab.Parent = TabFolder
            MainTab.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            MainTab.BorderSizePixel = 0
            MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
            MainTab.Size = UDim2.new(0, 475, 0, 350)
            MainTab.Visible = false
    
            local ScrollTab = Instance.new("ScrollingFrame")
            ScrollTab.Name = "ScrollTab"
            ScrollTab.Parent = MainTab
            ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollTab.BackgroundTransparency = 1.000
            ScrollTab.BorderSizePixel = 0
            ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
            ScrollTab.Size = UDim2.new(0, 475, 0, 330)
            ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollTab.ScrollBarThickness = 3
    
            local TabList = Instance.new("UIListLayout")
            TabList.Name = "TabList"
            TabList.Parent = ScrollTab
            TabList.SortOrder = Enum.SortOrder.LayoutOrder
            TabList.Padding = UDim.new(0, 5)
    
            local TabPadding = Instance.new("UIPadding")
            TabPadding.Name = "TabPadding"
            TabPadding.Parent = ScrollTab
            TabPadding.PaddingLeft = UDim.new(0, 10)
            TabPadding.PaddingTop = UDim.new(0, 10)
    
            PageButton.MouseButton1Click:Connect(function()
                currenttab = MainTab.Name
                for i,v in next, TabFolder:GetChildren() do 
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                end
                MainTab.Visible = true
    
                for i,v in next, ScrollPage:GetChildren() do 
                    if v:IsA("TextButton") then
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(225, 225, 225)}
                        ):Play()
                    end
                    TweenService:Create(
                        PageButton,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end
            end)
    
            if ff == false then
                TweenService:Create(
                    PageButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,0,0)}
                ):Play()
                for i,v in next, TabFolder:GetChildren() do 
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                    MainTab.Visible = true
                end
                ff = true
            end
    
            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 10)
                    ScrollTab.CanvasSize = UDim2.new(0,0,0,TabList.AbsoluteContentSize.Y + 30)
                end)
            end)
            
            local main = {}
            
            function main:AddButton(text,callback)
                local Button = Instance.new("TextButton")
    
                Button.Name = "Button"
                Button.Parent = ScrollTab
                Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Button.BackgroundTransparency = 0.1
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0, 455, 0, 30)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Gotham
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(225, 225, 225)
                Button.TextSize = 11.000
                Button.TextWrapped = true
                
                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Parent = Button
                
                Button.MouseEnter:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
                
                Button.MouseLeave:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)
                
                Button.MouseButton1Click:Connect(function()
                    callback()
                    Button.TextSize = 0
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                        {TextSize = 11}
                    ):Play()
                end)
            end
            
            function main:AddToggle(text,config,callback)
                local ToggleImage = Instance.new("Frame")
                
                local Toggle = Instance.new("TextButton")
                Toggle.Name = "Toggle"
                Toggle.Parent = ScrollTab
                Toggle.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Toggle.BackgroundTransparency = 0.1
                Toggle.BorderSizePixel = 0
                Toggle.AutoButtonColor = false
                Toggle.Size = UDim2.new(0, 455, 0, 30)
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000
                
                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Parent = Toggle
    
                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Parent = Toggle
                ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleLabel.BackgroundTransparency = 1.000
                ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
                ToggleLabel.Size = UDim2.new(0, 410, 0, 30)
                ToggleLabel.Font = Enum.Font.Gotham
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                ToggleLabel.TextSize = 11.000
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Toggle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
                ToggleImage.Position = UDim2.new(0, 425, 0, 5)
                ToggleImage.BorderSizePixel = 0
                ToggleImage.Size = UDim2.new(0, 20, 0, 20)
                local ToggleImageCorner = Instance.new("UICorner")
                ToggleImageCorner.Name = "ToggleImageCorner"
                ToggleImageCorner.CornerRadius = UDim.new(0, 5)
                ToggleImageCorner.Parent = ToggleImage
    
                local ToggleImage2 = Instance.new("Frame")
                ToggleImage2.Name = "ToggleImage2"
                ToggleImage2.Parent = ToggleImage
                ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleImage2.BackgroundColor3 = Color3.fromRGB(255,0,0)
                ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
                ToggleImage2.Visible = false
    
                local ToggleImage2Corner = Instance.new("UICorner")
                ToggleImage2Corner.Name = "ToggleImageCorner"
                ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
                ToggleImage2Corner.Parent = ToggleImage2
                
                Toggle.MouseEnter:Connect(function()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
    
                Toggle.MouseLeave:Connect(function()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)
                if config == nil then config = false end
                local toggled = config or false
                Toggle.MouseButton1Click:Connect(function()
                    if toggled == false then
                        toggled = true
                        ToggleImage2.Visible = true
                        ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                    else
                        toggled = false
                        ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.1,true)
                        wait(0.1)
                        ToggleImage2.Visible = false
                    end
                    callback(toggled)
                end)
                
                if config == true then
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                    toggled = true
                    callback(toggled)
                end
            end
    
            function main:AddTextbox(text,holder,disappear,callback)
                local Textboxx = Instance.new("Frame")
                local TextboxxCorner = Instance.new("UICorner")
                local TextboxTitle = Instance.new("TextLabel")
                local Textbox = Instance.new("TextBox")
                local TextboxCorner = Instance.new("UICorner")
    
                Textboxx.Name = "Textboxx"
                Textboxx.Parent = ScrollTab
                Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Textboxx.Size = UDim2.new(0, 455, 0, 30)
    
                TextboxxCorner.CornerRadius = UDim.new(0, 5)
                TextboxxCorner.Name = "TextboxxCorner"
                TextboxxCorner.Parent = Textboxx
    
                TextboxTitle.Name = "TextboxTitle"
                TextboxTitle.Parent = Textboxx
                TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.BackgroundTransparency = 1.000
                TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
                TextboxTitle.Size = UDim2.new(0, 300, 0, 30)
                TextboxTitle.Font = Enum.Font.Gotham
                TextboxTitle.Text = text
                TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextboxTitle.TextSize = 11.000
                TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                Textbox.Name = "Textbox"
                Textbox.Parent = Textboxx
                Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Textbox.Position = UDim2.new(0, 310, 0, 5)
                Textbox.Size = UDim2.new(0, 140, 0, 20)
                Textbox.Font = Enum.Font.Gotham
                Textbox.Text = holder
                Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                Textbox.TextSize = 11.000
    
                Textbox.FocusLost:Connect(function()
                    if #Textbox.Text > 0 then
                        callback(Textbox.Text)
                    end
                    if disappear then
                        Textbox.Text = ""
                    else
                        Textbox.Text = holder
                    end
                end)
    
                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Parent = Textbox
            end
    
            function main:AddDropdown(text,table,callback)
                local Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropButton = Instance.new("TextButton")
                local Droptitle = Instance.new("TextLabel")
                local DropScroll = Instance.new("ScrollingFrame")
                local DropdownList = Instance.new("UIListLayout")
                local DropdownPadding = Instance.new("UIPadding")
                local DropImage = Instance.new("ImageLabel")
                
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = ScrollTab
                Dropdown.Active = true
                Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(0, 455, 0, 30)
                
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Dropdown
                
                DropButton.Name = "DropButton"
                DropButton.Parent = Dropdown
                DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton.BackgroundTransparency = 1.000
                DropButton.Size = UDim2.new(0, 455, 0, 30)
                DropButton.Font = Enum.Font.SourceSans
                DropButton.Text = ""
                DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropButton.TextSize = 14.000
                
                Droptitle.Name = "Droptitle"
                Droptitle.Parent = Dropdown
                Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Droptitle.BackgroundTransparency = 1.000
                Droptitle.Position = UDim2.new(0.0281690136, 0, 0, 0)
                Droptitle.Size = UDim2.new(0, 410, 0, 30)
                Droptitle.Font = Enum.Font.Gotham
                Droptitle.Text = text.." : "
                Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                Droptitle.TextSize = 11.000
                Droptitle.TextXAlignment = Enum.TextXAlignment.Left
    
                DropImage.Name = "DropImage"
                DropImage.Parent = Dropdown
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.Position = UDim2.new(0, 425, 0, 5)
                DropImage.Rotation = 0
                DropImage.Size = UDim2.new(0, 20, 0, 20)
                DropImage.Image = "rbxassetid://5012539403"
                
                DropScroll.Name = "DropScroll"
                DropScroll.Parent = Droptitle
                DropScroll.Active = true
                DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropScroll.BackgroundTransparency = 1.000
                DropScroll.BorderSizePixel = 0
                DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
                DropScroll.Size = UDim2.new(0, 455, 0, 70)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
                DropScroll.ScrollBarThickness = 2
                
                DropdownList.Name = "DropdownList"
                DropdownList.Parent = DropScroll
                DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownList.Padding = UDim.new(0, 5)
                
                DropdownPadding.Name = "DropdownPadding"
                DropdownPadding.Parent = DropScroll
                DropdownPadding.PaddingTop = UDim.new(0, 5)
    
                local isdropping = false
    
                for i,v in next,table do
                    local DropButton2 = Instance.new("TextButton")
    
                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(v)
    
                    DropButton2.MouseEnter:Connect(function()
                        TweenService:Create(
                            DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(255,0,0)}
                        ):Play()
                    end)
                    DropButton2.MouseLeave:Connect(function()
                        TweenService:Create(
                            DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(225, 225, 225)}
                        ):Play()
                    end)
    
                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        Droptitle.Text =  text.." : "..tostring(v)
                        callback(v)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
    
                DropButton.MouseButton1Click:Connect(function()
                    if isdropping == false then
                        isdropping = true
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 100)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = -180}
                        ):Play()
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    else
                        isdropping = false
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end
                end)
                DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
    
                local drop = {}
    
                function drop:Clear()
                    Droptitle.Text = tostring(text).." :"
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 455, 0, 30)} 
                    ):Play()
                    isdropping = false
                    for i, v in next, DropScroll:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end
                function drop:Add(t)
                    local DropButton2 = Instance.new("TextButton")
    
                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(t)
    
                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        Droptitle.Text =  text.." : "..tostring(t)
                        callback(t)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
                return drop
            end
    
            function main:AddSlider(text,min,max,set,callback)
                set = (math.clamp(set,min,max))
                if set > max then set = max end
    
                local Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local SliderTitle = Instance.new("TextLabel")
                local SliderValue = Instance.new("TextLabel")
                local SliderButton = Instance.new("TextButton")
                local Bar1 = Instance.new("Frame")
                local Bar = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local CircleBar = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UICorner_4 = Instance.new("UICorner")
    
                Slider.Name = "Slider"
                Slider.Parent = ScrollTab
                Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Slider.Size = UDim2.new(0, 455, 0, 40)
    
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Slider
    
                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0, 290, 0, 20)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderTitle.TextSize = 11.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                SliderValue.Name = "SliderValue"
                SliderValue.Parent = Slider
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(0.887778878, 0, 0, 0)
                SliderValue.Size = UDim2.new(0, 40, 0, 20)
                SliderValue.Font = Enum.Font.Gotham
                SliderValue.Text =  tostring(set and math.floor( (set / max) * (max - min) + min) or 0)
                SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderValue.TextSize = 11.000
    
                SliderButton.Name = "SliderButton"
                SliderButton.Parent = Slider
                SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderButton.BackgroundTransparency = 1.000
                SliderButton.Position = UDim2.new(0, 10, 0, 25)
                SliderButton.Size = UDim2.new(0, 435, 0, 5)
                SliderButton.AutoButtonColor = false
                SliderButton.Font = Enum.Font.SourceSans
                SliderButton.Text = ""
                SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderButton.TextSize = 14.000
    
                Bar1.Name = "Bar1"
                Bar1.Parent = SliderButton
                Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Bar1.Size = UDim2.new(0, 435, 0, 5)
    
                Bar.Name = "Bar"
                Bar.Parent = Bar1
                Bar.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Bar.Size = UDim2.new(set/max, 0, 0, 5)
    
                UICorner_2.CornerRadius = UDim.new(0, 100)
                UICorner_2.Parent = Bar
    
                CircleBar.Name = "CircleBar"
                CircleBar.Parent = Bar
                CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CircleBar.Position = UDim2.new(1, -2, 0, -2)
                CircleBar.AnchorPoint = Vector2.new(0, 0.1)
                CircleBar.Size = UDim2.new(0, 10, 0, 10)
    
                UICorner_3.CornerRadius = UDim.new(0, 100)
                UICorner_3.Parent = CircleBar
    
                UICorner_4.CornerRadius = UDim.new(0, 100)
                UICorner_4.Parent = Bar1
                
                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
    
                if Value == nil then
                    Value = set
                    pcall(function()
                        callback(Value)
                    end)
                end
                
                SliderButton.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    moveconnection = mouse.Move:Connect(function()
                        SliderValue.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                            CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        SliderValue.Text = Value
                    end
                end)
            end
            function main:AddSeperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local SepLabel = Instance.new("TextLabel")
                local Sep2 = Instance.new("Frame")
    
                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollTab
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.ClipsDescendants = true
                Seperator.Size = UDim2.new(0, 455, 0, 20)
    
                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 150, 0, 1)
    
                SepLabel.Name = "SepLabel"
                SepLabel.Parent = Seperator
                SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SepLabel.BackgroundTransparency = 1.000
                SepLabel.Position = UDim2.new(0, 95, 0, 0)
                SepLabel.Size = UDim2.new(0, 255, 0, 20)
                SepLabel.Font = Enum.Font.Gotham
                SepLabel.Text = text
                SepLabel.TextColor3 = Color3.fromRGB(225,225,225)
                SepLabel.TextSize = 11.000
    
                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep2.BorderSizePixel = 0
                Sep2.Position = UDim2.new(0, 305, 0, 10)
                Sep2.Size = UDim2.new(0, 150, 0, 1)
            end
            function main:AddLine()
                local Line = Instance.new("Frame")
                local Linee = Instance.new("Frame")
    
                Line.Name = "Line"
                Line.Parent = ScrollTab
                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Line.BackgroundTransparency = 1.000
                Line.ClipsDescendants = true
                Line.Size = UDim2.new(0, 455, 0, 20)
    
                Linee.Name = "Linee"
                Linee.Parent = Line
                Linee.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Linee.BorderSizePixel = 0
                Linee.Position = UDim2.new(0, 0, 0, 10)
                Linee.Size = UDim2.new(0, 455, 0, 1)
            end
            function main:AddLabel(text)
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}
        
                Label.Name = "Label"
                Label.Parent = ScrollTab
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 455, 0, 20)
                Label.Font = Enum.Font.Gotham
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 11.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left
    
                PaddingLabel.PaddingLeft = UDim.new(0,10)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"
        
                function labell:Set(newtext)
                    Label.Text = newtext
                end
    
                return labell
            end
            
            return main
        end
        return uitab
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    local Toggle = Instance.new("TextButton")
    
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui
    
    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Toggle.Size = UDim2.new(0, 50, 0, 50)
    Toggle.Font = Enum.Font.Code
    Toggle.Text = "R"
    Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    Toggle.TextScaled = true
    Toggle.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
    end)
    --
    function CheckQuest()
        local MyLevel = game:GetService("Players").LocalPlayer.PlayerStats.Level.Value
        if MyLevel >= 1 and MyLevel < 15 then
            Mon = "Bandit [Lv:5]"
            NameQuest = "Bandit"
        elseif MyLevel >= 15 and MyLevel < 30 then 
            Mon = "Pirates [Lv:15]"
            NameQuest = "Pirates"
        elseif MyLevel >= 30 and MyLevel < 60 then
            Mon = "BagyPirates [Lv:30]"
            NameQuest = "BagyPirates"
        elseif MyLevel >= 60 and MyLevel < 150 then
            Mon = "Clown Pirate [Lv:60]"
            NameQuest = "Clown Pirate"
        elseif MyLevel >= 150 and MyLevel < 200 then
            Mon = "Revolutionary Troop [Lv:150]"
            NameQuest = "Revolutionary Troop"
        elseif MyLevel >= 200 and MyLevel < 500 then
            Mon = "Marines [Lv:200]"
            NameQuest = "Marines"
        elseif MyLevel >= 500 and MyLevel < 600 then
           Mon = "Marines [Lv:200]"
            NameQuest = "Marines"
        elseif MyLevel >= 600 and MyLevel < 700 then
            Mon = "Fishman [Lv:600]"
            NameQuest = "Fishman"
        elseif MyLevel >= 700 and MyLevel < 850 then
            Mon = "WinterBandit [Lv:700]"
            NameQuest = "WinterBandit"
        elseif MyLevel >= 850 and MyLevel < 950 then
            Mon = "Sky Bandit [Lv:850]"
            NameQuest = "Sky Bandit"
        elseif MyLevel >= 950 and MyLevel < 1150 then
            Mon = "Sky Bandit [Lv:850]"
            NameQuest = "Sky Bandit"
        elseif MyLevel >= 1150 and MyLevel < 1200 then
            Mon = "Monkey [Lv:1150]"
            NameQuest = "Monkey"
        elseif MyLevel >= 1200 and MyLevel < 1400 then 
            Mon = "Monkey [Lv:1150]"
            NameQuest = "Monkey"
        elseif MyLevel >= 1400 then 
            Mon = "Skeleton [Lv:1400]"
            NameQuest = "Skeleton"
        end
    end
    
    function fly()
        local mouse=game.Players.LocalPlayer:GetMouse''
        localplayer=game.Players.LocalPlayer
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
        local speedSET=25
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                    wait()
                    localplayer.Character.Humanoid.PlatformStand=true
                    local new=gyro.CFrame - gyro.CFrame.p + pos.position
                    if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=1
                    end
                    if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed+speedSET
                    end
                    if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed+speedSET
                    end
                    if speed>speedSET then
                    speed=speedSET
                    end
                    pos.position=new.p
                    if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                    elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                    else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                    end
            until not Fly
            if gyro then 
                    gyro:Destroy() 
            end
            if pos then 
                    pos:Destroy() 
            end
            flying=false
            localplayer.Character.Humanoid.PlatformStand=false
            speed=0
        end
        e1=mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then 
                    flying=false e1:disconnect() e2:disconnect() return 
            end
            if key=="w" then
                keys.w=true
            elseif key=="s" then
                keys.s=true
            elseif key=="a" then
                keys.a=true
            elseif key=="d" then
                keys.d=true
            end
        end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
        start()
    end
    
    function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport() 
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end
    
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if _G.NoClip or _G.AutoFarm or _G.AutoFarmFactory or _G.AutoSeaBeats or _G.AutoTreeMonster or _G.AutoFlameEmperor or _G.AutoGodOfLighting or _G.AutoFarmPlayer or _G.AutoSwordMan or _G.AutoShisui then
                if not game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    local Part = Instance.new("Part")
                    Part.Name = "TaiFoot"
                    Part.Parent = game.Workspace
                    Part.Anchored = true
                    Part.Transparency = 1
                    Part.Size = Vector3.new(30,0.5,30)
                elseif game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    game.Workspace["TaiFoot"].CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.92,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                end
            else
                if game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    game:GetService("Workspace"):FindFirstChild("TaiFoot"):Destroy()
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.NoClip or _G.AutoFarm or _G.AutoFarmFactory or _G.AutoSeaBeats or _G.AutoTreeMonster or _G.AutoFlameEmperor or _G.AutoGodOfLighting or _G.AutoFarmPlayer or _G.AutoSwordMan or _G.AutoShisui then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)
    
    function EquipWeapon(ToolSe)
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            getgenv().tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait()
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
        end
    end
    
    function AutoHaki()
        if not game.Players.LocalPlayer.Character:FindFirstChild("Buso") then
            game:GetService("ReplicatedStorage").Haki:FireServer("Buso")
        end
    end
    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    
    FarmMethod = CFrame.new(0,1,2.5)
    --
    local RenUi = library:AddWindow("Ren Hub | LP",Enum.KeyCode.RightControl)
    --
    local Main = RenUi:AddTab("Auto Farm","6026568198")
    local Stats = RenUi:AddTab("Stats","7040410130")
    local Combat = RenUi:AddTab("Combat","7251993295")
    local Teleport = RenUi:AddTab("Teleport","7044226690")
    local Shop = RenUi:AddTab("Shop","6031265976")
    local Misc = RenUi:AddTab("Misc","6034900727")
    --
    Main:AddSeperator("Settings")
    
    Time = Main:AddLabel("Server Time")
    
    function UpdateTime()
        local GameTime = math.floor(workspace.DistributedGameTime+0.5)
        local Hour = math.floor(GameTime/(60^2))%24
        local Minute = math.floor(GameTime/(60^1))%60
        local Second = math.floor(GameTime/(60^0))%60
        Time:Set("Hr(s) : "..Hour.." Min(s) : "..Minute.." Sec(s) : "..Second)
    end
    
    spawn(function()
        while task.wait() do
            pcall(function()
                UpdateTime()
            end)
        end
    end)
    
    WeaponList = {}
    
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(WeaponList, v.Name)
        end
    end
    
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(WeaponList ,v.Name)
        end
    end
    
    local SelectP = Main:AddDropdown("Select Weapon",WeaponList,function(value)
        _G.SelectWeapon = value
    end)
    
    Main:AddButton("Refresh Weapon",function()
        SelectP:Clear()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
            if v:IsA("Tool") then
                SelectP:Add(v.Name)
            end
        end
        
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
            if v:IsA("Tool") then
                SelectP:Add(v.Name)
            end
        end
    end)
    
    Main:AddSeperator("Main")
    
    Main:AddToggle("Auto Farm Level",_G.AutoFarm,function(value)
        _G.AutoFarm = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoFarm then
                pcall(function()
                    CheckQuest()
                    if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Enabled then
                        for i,v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                            if game:GetService("Workspace").Lives:FindFirstChild(Mon) then
                                if v.Name == Mon then
                                    if v.Torso.Transparency ~= 1 then    
                                        if string.find(game:GetService("Players").LocalPlayer.Quest.Doing.Value, NameQuest) then
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),game:GetService("Workspace").Camera.CFrame)
                                            until v.Torso.Transparency == 1 or not _G.AutoFarm or not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Enabled
                                        else
                                            game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Enabled = false
                                        end
                                    end
                                end
                            end
                        end
                    elseif not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Enabled then
                        game:GetService("ReplicatedStorage").FuncQuest:InvokeServer(NameQuest)
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Factory")
    
    Main:AddToggle("Auto Factory",_G.AutoFarmFactory,function(value)
        _G.AutoFarmFactory = value
    end)
    
    Main:AddToggle("Auto Factory Hop",_G.AutoFarmFactory_Hop,function(value)
        _G.AutoFarmFactory_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoFarmFactory then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("Factory") then
                            if v.Name == "Factory" then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),game:GetService("Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or not game:GetService("Workspace").Lives:FindFirstChild("Factory") or not _G.AutoFarmFactory or not v.Parent
                            end
                        else
                            if _G.AutoFarmFactory_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Sea Beats")
    
    Main:AddToggle("Auto Sea Beats",_G.AutoSeaBeats,function(value)
        _G.AutoSeaBeats = value
    end)
    
    Main:AddToggle("Auto Sea Beats Hop",_G.AutoSeaBeats_Hop,function(value)
        _G.AutoSeaBeats_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoSeaBeats then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("Sea Beast") then
                            if v.Name == "Sea Beast" then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),game:GetService("Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or not game:GetService("Workspace").Lives:FindFirstChild("Sea Beast") or not _G.AutoSeaBeats or not v.Parent
                            end
                        else
                            if _G.AutoSeaBeats_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Tree Monster")
    
    Main:AddToggle("Auto Tree Monster",_G.AutoTreeMonster,function(value)
        _G.AutoTreeMonster = value
    end)
    
    Main:AddToggle("Auto Tree Monster Hop",_G.AutoTreeMonster_Hop,function(value)
        _G.AutoTreeMonster_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoTreeMonster then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("TreeMoster") then
                            if v.Name == "TreeMoster" then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),game:GetService("Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or not game:GetService("Workspace").Lives:FindFirstChild("TreeMoster") or not _G.AutoTreeMonster or not v.Parent
                            end
                        else
                            if _G.AutoTreeMonster_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Sword Man")
    
    Main:AddToggle("Auto Sword Man",_G.AutoSwordMan,function(value)
        _G.AutoSwordMan = value
    end)
    
    Main:AddToggle("Auto Sword Man Hop",_G.AutoSwordMan_Hop,function(value)
        _G.AutoSwordMan_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoSwordMan then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("Sword Man [Boss]") then
                            if v.Name == "Sword Man [Boss]" then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),game:GetService("Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or not game:GetService("Workspace").Lives:FindFirstChild("Sword Man [Boss]") or not _G.AutoSwordMan or not v.Parent
                            end
                        else
                            if _G.AutoSwordMan_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Flame Emperor")
    
    Main:AddToggle("Auto Flame Emperor",_G.AutoFlameEmperor,function(value)
        _G.AutoFlameEmperor = value
    end)
    
    Main:AddToggle("Auto Flame Emperor Hop",_G.AutoFlameEmperor_Hop,function(value)
        _G.AutoFlameEmperor_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoFlameEmperor then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("Flame Emperor [Boss]") then
                            if v.Name == "Flame Emperor [Boss]" then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),game:GetService("Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or not game:GetService("Workspace").Lives:FindFirstChild("Flame Emperor [Boss]") or not _G.AutoFlameEmperor or not v.Parent
                            end
                        else
                            if _G.AutoFlameEmperor_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("God Of Lighting")
    
    Main:AddToggle("Auto God Of Lighting",_G.AutoGodOfLighting,function(value)
        _G.AutoGodOfLighting = value
    end)
    
    Main:AddToggle("Auto God Of Lighting Hop",_G.AutoGodOfLighting_Hop,function(value)
        _G.AutoGodOfLighting_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoGodOfLighting then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("God Of Lighting") then
                            if v.Name == "God Of Lighting" then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),game:GetService("Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or not game:GetService("Workspace").Lives:FindFirstChild("God Of Lighting") or not _G.AutoGodOfLighting or not v.Parent
                            end
                        else
                            if _G.AutoGodOfLighting_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Main:AddSeperator("Shisui")
    
    Main:AddToggle("Auto Shisui",_G.AutoShisui,function(value)
        _G.AutoShisui = value
    end)
    
    Main:AddToggle("Auto Shisui Hop",_G.AutoShisui_Hop,function(value)
        _G.AutoShisui_Hop = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoShisui then 
                pcall(function()
                    if game.Players.LocalPlayer.PlayerStats.Experience.Value >= 10 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3062.078369140625, 35.42287826538086, -2440.669677734375)
                        wait(.8)
                        game:GetService("ReplicatedStorage").BuyMysterious:InvokeServer("Shushi",true)
                        wait(.5)
                        game:GetService("ReplicatedStorage").BuyMysterious:InvokeServer("Shushi",false)
                    else
                        for i,v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                            if game:GetService("Workspace").Lives:FindFirstChild("TreeMoster") then
                                if v.Name == "TreeMoster" then
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),game:GetService("Workspace").Camera.CFrame)
                                    until v.Humanoid.Health <= 0 or not game:GetService("Workspace").Lives:FindFirstChild("TreeMoster") or not _G.AutoShisui or not v.Parent
                                end
                            else
                                if _G.AutoShisui_Hop then
                                    Hop()
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Combat:AddSeperator("Settings")
    
    PlayerName = {}
    for i,v in pairs(game.Players:GetChildren()) do  
        if v.Name ~= game.Players.LocalPlayer.Name then
            table.insert(PlayerName ,v.Name)
        end
    end
    
    local SelectedPly = Combat:AddDropdown("Select Players",PlayerName,function(value)
        _G.SelectPly = value
    end)
    
    Combat:AddButton("Refresh Player",function()
        PlayerName = {}
        SelectedPly:Clear()
        for i,v in pairs(game.Players:GetChildren()) do  
            if v.Name ~= game.Players.LocalPlayer.Name then
                SelectedPly:Add(v.Name)
            end
        end
    end)
    
    Combat:AddSeperator("Menu")
    
    Combat:AddToggle("Spectate Player",false,function(value)
        Spectate = value
        local plr1 = game.Players.LocalPlayer.Character.Humanoid
        local plr2 = game.Players:FindFirstChild(_G.SelectPly)
        repeat task.wait()
            game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
        until Spectate == false 
        game.Workspace.Camera.CameraSubject = plr1
    end)
    
    Combat:AddButton("Teleport",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame
    end)
    
    Combat:AddSeperator("Farm")
    
    Weaponply = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Weaponply,v.Name)
        end
    end
    
    local SelectWeaponply = Combat:AddDropdown("Select Weapon",Weaponply,function(value)
        _G.SelectWeaponKill = value
    end)
    
    Combat:AddButton("Refresh Weapon",function()
        SelectWeaponply:Clear()
        Weaponply = {}
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeaponply:Add(v.Name)
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeaponply:Add(v.Name)
            end
        end
    end)
    
    Combat:AddToggle("Auto Farm Player",false,function(value)
        _G.AutoFarmPlayer = value
    end)
    
    spawn(function()
        while wait() do 
            pcall(function()
                if _G.AutoFarmPlayer then
                    if game.Players:FindFirstChild(_G.SelectPly) and game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeaponKill)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or not _G.AutoFarmPlayer or not game.Players:FindFirstChild(_G.SelectPly)
                    end
                end
            end)
        end
    end)
    
    Stats:AddSeperator("Stats")
    
    Stats:AddToggle("Auto Malee",_G.AutoMalee,function(value)
        _G.AutoMalee = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoMalee then
                if game:GetService("Players").LocalPlayer.PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("ReplicatedStorage").okStats:FireServer(_G.SelectPoints,"1")
                    end)
                end
            end
        end
    end)
    
    Stats:AddToggle("Auto Sword",_G.AutoSword,function(value)
        _G.AutoSword = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoSword then
                if game:GetService("Players").LocalPlayer.PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("ReplicatedStorage").okStats:FireServer(_G.SelectPoints,"2")
                    end)
                end
            end
        end
    end)
    
    Stats:AddToggle("Auto Defense",_G.AutoDefense,function(value)
        _G.AutoDefense = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoDefense then
                if game:GetService("Players").LocalPlayer.PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("ReplicatedStorage").okStats:FireServer(_G.SelectPoints,"3")
                    end)
                end
            end
        end
    end)
    
    Stats:AddToggle("Auto Devil Fruits",_G.AutoDevilFruits,function(value)
        _G.AutoDevilFruits = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoDevilFruits then
                if game:GetService("Players").LocalPlayer.PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("ReplicatedStorage").okStats:FireServer(_G.SelectPoints,"4")
                    end)
                end
            end
        end
    end)
    
    Stats:AddSeperator("Settings")
    
    local PointsLabel = Stats:AddLabel("Points")
    
    spawn(function()
        while wait() do
            pcall(function()
                PointsLabel:Set("Points : "..game:GetService("Players").LocalPlayer.PlayerStats.Points.Value)
            end)
        end
    end)
    
    _G.SelectPoints = 1
    Stats:AddSlider("Select Points",1,100,1,function(value)
        _G.SelectPoints = value
    end)
    
    Teleport:AddSeperator("Island")
    
    Teleport:AddButton("Start Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(375.6844177246094, 40.559078216552734, -1817.482666015625)
    end)
    
    Teleport:AddButton("justical Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2626.17724609375, 66.47785949707031, 191.99685668945312)
    end)
    
    Teleport:AddButton("Rock Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2115.826904296875, 128.0514373779297, -2987.5615234375)
    end)
    
    Teleport:AddButton("Carnival Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1576.714111328125, 91.70256805419922, 578.6084594726562)
    end)
    
    Teleport:AddButton("Chef Ship Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1112.2225341796875, 238.87881469726562, -5139.44970703125)
    end)
    
    Teleport:AddButton("Fishman Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4875.50341796875, 55.92596435546875, 1960.6123046875)
    end)
    
    Teleport:AddButton("Snow Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2329.197265625, 317.1258544921875, 4727.833984375)
    end)
    
    Teleport:AddButton("Sky Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-81.80178833007812, 341.2190246582031, 3342.12890625)
    end)
    
    Teleport:AddButton("Banadian Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3003.07958984375, 34.90738296508789, -2876.93701171875)
    end)
    
    Teleport:AddButton("Factory Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-63.78919219970703, 24.393857955932617, -9258.2197265625)
    end)
    
    Teleport:AddButton("Colosseum Island",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5226.998046875, 39.16239929199219, -2048.358154296875)
    end)
    
    Teleport:AddButton("Valenta Land",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5530.51367, 50, -5784.32617, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end)
    
    Teleport:AddSeperator("NPC")
    
    Teleport:AddLabel("Fighting Style")
    
    Teleport:AddButton("Blackleg V1",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1106.1300048828, 83.481460571289, -5288.6684570312)
    end)
    
    Teleport:AddButton("FishmanKarate",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4993.3798828125, 3.8742942810059, 1891.7390136719)
    end)
    
    Teleport:AddLabel("Seller")
    
    Teleport:AddButton("Saber",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3137.8322753906, 71.283683776855, -2336.1936035156)
    end)
    
    Teleport:AddButton("Shisui",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3062.8059082031, 35.422878265381, -2443.71875)
    end)
    
    Teleport:AddButton("Pole",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-67.620330810547, 263.66351318359, 3411.5913085938)
    end)
    
    Teleport:AddButton("Bisento",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3234.86328125, 60.833969116211, -2618.2893066406)
    end)
    
    Teleport:AddButton("Bisento V2",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2414.9047851562, 22.441854476929, 5015.9580078125)
    end)
    
    Teleport:AddLabel("Misc NPC")
    
    Teleport:AddButton("Buso Color",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30.596668243408, 25.325693130493, -9159.78515625)
    end)
    
    Teleport:AddButton("Ken Haki",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6276.5288085938, 32.993175506592, 3838.0651855469)
    end)
    
    Teleport:AddButton("Buso Haki",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2202.8803710938, 136.26412963867, -2478.4768066406)
    end)
    
    Teleport:AddButton("Reset Stats",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-44.78331756591797, 25.325693130493164, -9114.814453125)
    end)
    
    Shop:AddSeperator("Sword")
    
    Shop:AddButton("Cutlass",function()
        game:GetService("ReplicatedStorage").BuySword:InvokeServer("Cutlass")
    end)
    
    Shop:AddButton("Katana",function()
        game:GetService("ReplicatedStorage").BuySword:InvokeServer("Katana")
    end)
    
    Shop:AddButton("Saber",function()
        game:GetService("ReplicatedStorage").BuySword:InvokeServer("Saber")
    end)
    
    Shop:AddButton("Bisento",function()
        game:GetService("ReplicatedStorage").BuySword:InvokeServer("Bisento")
    end)
    
    Shop:AddButton("Bisento V2",function()
        game:GetService("ReplicatedStorage").UpgradePowa:InvokeServer("BisentoV2")
    end)
    
    Shop:AddButton("Pole",function()
        game:GetService("ReplicatedStorage").BuySword:InvokeServer("Pole")
    end)
    
    Shop:AddButton("Shisui",function()
        game:GetService("ReplicatedStorage").BuyMysterious:InvokeServer("Shushi",true)
        wait(.5)
        game:GetService("ReplicatedStorage").BuyMysterious:InvokeServer("Shushi",false)
    end)
    
    Shop:AddSeperator("Abilities")
    
    Shop:AddButton("Buso",function()
        game:GetService("ReplicatedStorage").BuySpecial:InvokeServer("BusoHaki")
    end)
    
    Shop:AddButton("Buso Color",function()
        game:GetService("ReplicatedStorage").HakiColour:InvokeServer()
    end)
    
    Misc:AddSeperator("Server")
    
    Misc:AddButton("Rejoin Server",function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end)
    
    Misc:AddButton("Server Hop",function()
        Hop()
    end)
    
    Misc:AddButton("Hop To Lower Player",function()
        getgenv().AutoTeleport = true
        getgenv().DontTeleportTheSameNumber = true 
        getgenv().CopytoClipboard = false
        if not game:IsLoaded() then
            print("Game is loading waiting...")
        end
        local maxplayers = math.huge
        local serversmaxplayer;
        local goodserver;
        local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" 
        function serversearch()
            for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
                if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                    serversmaxplayer = v.maxPlayers
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end       
        end
        function getservers()
            serversearch()
            for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
                if i == "nextPageCursor" then
                    if gamelink:find("&cursor=") then
                        local a = gamelink:find("&cursor=")
                        local b = gamelink:sub(a)
                        gamelink = gamelink:gsub(b, "")
                    end
                    gamelink = gamelink .. "&cursor=" ..v
                    getservers()
                end
            end
        end 
        getservers()
        if AutoTeleport then
            if DontTeleportTheSameNumber then 
                if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
                    return warn("It has same number of players (except you)")
                elseif goodserver == game.JobId then
                    return warn("Your current server is the most empty server atm") 
                end
            end
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
        end
    end)
    
    Misc:AddSeperator("Codes")
    
    CodesData = {}
    
    for i,v in pairs(game:GetService("Players").LocalPlayer.CodeData:GetChildren()) do
        table.insert(CodesData,v.Name)
    end
    
    Misc:AddButton("Redeem All Codes",function()
        for i,v in pairs(CodesData) do
            game:GetService("ReplicatedStorage").CodeEnter:FireServer(v,game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("New Gui Image").CodeGUI.TextBox)
        end
    end)
    
    Misc:AddSeperator("Character")
    
    Misc:AddToggle("NoClip",_G.NoClip,function(value)
        _G.NoClip = value
    end)
    
    Misc:AddToggle("Fly",false,function(value)
        Fly = value
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if Fly then
                    fly()
                end
            end)
        end
    end)
else
    game.Players.LocalPlayer:Kick("\224\185\132\224\184\161\224\185\136\224\184\158\224\184\154\224\185\129\224\184\161\224\184\158")
    wait(1)
    game:Shutdown()
end
