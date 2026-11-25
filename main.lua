--[[
  K2 Setup Tutorial GUI (standalone)
  Shows when no target brainrots / for TikTok PRO unlock guide.
]]
repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LP = Players.LocalPlayer
local pg = LP:WaitForChild("PlayerGui")

local genv = (getgenv and getgenv()) or _G
local DISCORD_LINK = genv.DISCORD_LINK or "https://discord.gg/bxjXucMVqB"

local function showJoinDiscordGui()
	local old = pg:FindFirstChild("BrainrotJoinDiscordGui")
	if old then old:Destroy() end

	local LOGO_ID = "rbxassetid://137341352846357"
	local BG_ID   = "rbxassetid://131683450353430"

	local INVITE_URL = (type(genv.TIKTOK_PRO_INVITE) == "string" and genv.TIKTOK_PRO_INVITE ~= "" and genv.TIKTOK_PRO_INVITE)
		or "https://pro.tiktok.com/t/ZP9PHo8w86otq-icgNm/"
	local SUPPORT_DISCORD = DISCORD_LINK or "https://discord.gg/bxjXucMVqB"

	local Colors = {
		violet   = Color3.fromRGB(145, 145, 145),
		violetDk = Color3.fromRGB(85, 85, 85),
		blue     = Color3.fromRGB(185, 185, 185),
		accent   = Color3.fromRGB(205, 205, 205),
		bg0      = Color3.fromRGB(8, 7, 14),
		bg1      = Color3.fromRGB(13, 11, 23),
		card     = Color3.fromRGB(20, 17, 34),
		cardHi   = Color3.fromRGB(30, 26, 50),
		line     = Color3.fromRGB(72, 72, 72),
		off      = Color3.fromRGB(55, 55, 55),
		white    = Color3.fromRGB(255, 255, 255),
		muted    = Color3.fromRGB(175, 175, 175),
		dim      = Color3.fromRGB(125, 125, 125),
		green    = Color3.fromRGB(64, 224, 128),
		amber    = Color3.fromRGB(255, 190, 70),
		red      = Color3.fromRGB(220, 80, 90),
		black    = Color3.fromRGB(4, 3, 8),
		cyan     = Color3.fromRGB(120, 210, 255),
	}

	local function tw(obj, info, goal)
		local t = TweenService:Create(obj, info, goal)
		t:Play()
		return t
	end
	local function corner(obj, r)
		local c = Instance.new("UICorner")
		c.CornerRadius = typeof(r) == "UDim" and r or UDim.new(0, r or 12)
		c.Parent = obj
		return c
	end
	local function round(obj)
		return corner(obj, UDim.new(1, 0))
	end
	local function stroke(obj, color, thick, alpha)
		local s = Instance.new("UIStroke")
		s.Color = color
		s.Thickness = thick or 1
		s.Transparency = alpha or 0
		s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		s.Parent = obj
		return s
	end
	local function copyText(str)
		for _, fn in ipairs({ setclipboard, toclipboard, writeclipboard }) do
			if type(fn) == "function" then
				local ok = pcall(fn, str)
				if ok then return true end
			end
		end
		return false
	end

	local STEPS = {
		{
			title = "Unlock required",
			body = "This build needs a quick unlock before it can run.\n\nFollow the steps in this guide (takes about 2–3 minutes).\n\nYou only need the official TikTok PRO invite link — no payment outside that flow, and no random downloads.",
			showLink = false, tip = "Tip: use only the invite link shown in this menu.",
		},
		{
			title = "What you need",
			body = "To unlock the script you need:\n\n1) The official TikTok PRO invite link\n2) About 2–3 minutes on your phone\n3) Your normal TikTok account\n\nUse only the invite link shown in this guide. Do not use random third-party downloads.",
			showLink = false, tip = "Never install from unofficial sites.",
		},
		{
			title = "Copy the TikTok PRO invite",
			body = "Tap COPY LINK below, then open it in your phone browser or TikTok in-app browser.\n\nWhat you should see:\n• An official TikTok PRO invite page\n• A clear Install / Get access button\n\nIf the page looks different or asks for payment outside TikTok PRO, stop and join Discord for help.",
			showLink = true, tip = "Use the COPY button — don’t type the URL by hand.",
		},
		{
			title = "Install TikTok PRO",
			body = "On the invite page:\n\n1) Sign in with the TikTok account you actually use\n2) Accept the invite / install TikTok PRO\n3) Wait until install finishes completely\n4) Open TikTok PRO at least once so it registers\n\nDo not skip opening the app — incomplete installs fail access checks.",
			showLink = true, tip = "Stay on Wi-Fi. Close other downloads while installing.",
		},
		{
			title = "Re-execute this script",
			body = "After install:\n\n1) Return to Roblox\n2) Open your executor\n3) Run the SAME loader you used before\n\nOnce unlock is complete, the script should load normally on re-execute.\n\nIf this screen appears again, repeat the invite steps once more.",
			showLink = false, tip = "Use the same loader / key you already have.",
		},
		{
			title = "Need help?",
			body = "Still stuck?\n\n• Re-copy the invite and open it again\n• Make sure TikTok PRO finished installing\n• Open TikTok PRO once, then re-run the script\n\nSupport Discord is below — send:\nexecutor name · PlaceId · screenshot of this GUI",
			showLink = false, showDiscord = true, tip = "Support is fastest with a screenshot.",
		},
	}
	local TOTAL = #STEPS

	local gui = Instance.new("ScreenGui")
	gui.Name = "BrainrotJoinDiscordGui"
	gui.ResetOnSpawn = false
	gui.IgnoreGuiInset = true
	gui.DisplayOrder = 1000
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	gui.Parent = pg

	local root = Instance.new("Frame")
	root.Name = "Root"
	root.Size = UDim2.fromScale(1, 1)
	root.BackgroundColor3 = Colors.bg0
	root.BorderSizePixel = 0
	root.ClipsDescendants = true
	root.ZIndex = 1
	root.Parent = gui

	local skyG = Instance.new("UIGradient")
	skyG.Rotation = 35
	skyG.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 14, 44)),
		ColorSequenceKeypoint.new(0.45, Colors.bg0),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 16, 36)),
	})
	skyG.Parent = root

	local bgTex = Instance.new("ImageLabel")
	bgTex.Size = UDim2.fromScale(1, 1)
	bgTex.BackgroundTransparency = 1
	bgTex.Image = BG_ID
	bgTex.ScaleType = Enum.ScaleType.Crop
	bgTex.ImageTransparency = 0.88
	bgTex.ZIndex = 1
	bgTex.Parent = root

	local vignette = Instance.new("Frame")
	vignette.Size = UDim2.fromScale(1, 1)
	vignette.BackgroundColor3 = Colors.black
	vignette.BackgroundTransparency = 0.5
	vignette.BorderSizePixel = 0
	vignette.ZIndex = 2
	vignette.Parent = root

	local particleLayer = Instance.new("Frame")
	particleLayer.Size = UDim2.fromScale(1, 1)
	particleLayer.BackgroundTransparency = 1
	particleLayer.ZIndex = 3
	particleLayer.Parent = root
	local particles = {}
	for i = 1, 14 do
		local p = Instance.new("Frame")
		p.Size = UDim2.fromOffset(math.random(2, 3), math.random(2, 3))
		p.Position = UDim2.new(math.random(), 0, math.random(), 0)
		p.BackgroundColor3 = Colors.accent
		p.BackgroundTransparency = 0.55 + math.random() * 0.3
		p.BorderSizePixel = 0
		p.ZIndex = 3
		p.Parent = particleLayer
		round(p)
		particles[i] = { frame = p, speed = 0.004 + math.random() * 0.01, drift = (math.random() - 0.5) * 0.008, baseT = p.BackgroundTransparency }
	end
	task.spawn(function()
		while gui.Parent do
			local t = tick()
			skyG.Rotation = 35 + math.sin(t * 0.2) * 12
			for _, pt in ipairs(particles) do
				local f = pt.frame
				if f and f.Parent then
					local x = f.Position.X.Scale + pt.drift * 0.016
					local y = f.Position.Y.Scale - pt.speed * 0.9
					if y < -0.04 then y = 1.04; x = math.random() end
					if x < -0.04 then x = 1.04 elseif x > 1.04 then x = -0.04 end
					f.Position = UDim2.fromScale(x, y)
					f.BackgroundTransparency = pt.baseT + math.sin(t * 1.4 + x * 8) * 0.08
				end
			end
			task.wait(0.05)
		end
	end)

	local shell = Instance.new("Frame")
	shell.Name = "Shell"
	shell.AnchorPoint = Vector2.new(0.5, 0.5)
	shell.Position = UDim2.fromScale(0.5, 0.5)
	shell.Size = UDim2.new(0.92, 0, 0.9, 0)
	shell.BackgroundColor3 = Colors.card
	shell.BackgroundTransparency = 0.08
	shell.BorderSizePixel = 0
	shell.ClipsDescendants = true
	shell.ZIndex = 10
	shell.Parent = root
	corner(shell, 18)
	stroke(shell, Colors.line, 1, 0.35)

	local shellConstraint = Instance.new("UISizeConstraint")
	shellConstraint.MaxSize = Vector2.new(440, 640)
	shellConstraint.MinSize = Vector2.new(280, 420)
	shellConstraint.Parent = shell

	local shellPad = Instance.new("UIPadding")
	shellPad.PaddingTop = UDim.new(0, 14)
	shellPad.PaddingBottom = UDim.new(0, 12)
	shellPad.PaddingLeft = UDim.new(0, 14)
	shellPad.PaddingRight = UDim.new(0, 14)
	shellPad.Parent = shell

	local layout = Instance.new("UIListLayout")
	layout.FillDirection = Enum.FillDirection.Vertical
	layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Padding = UDim.new(0, 8)
	layout.Parent = shell

	local header = Instance.new("Frame")
	header.BackgroundTransparency = 1
	header.Size = UDim2.new(1, 0, 0, 72)
	header.LayoutOrder = 1
	header.ZIndex = 11
	header.Parent = shell

	local ring = Instance.new("Frame")
	ring.Size = UDim2.fromOffset(44, 44)
	ring.Position = UDim2.new(0, 0, 0.5, -22)
	ring.BackgroundColor3 = Colors.white
	ring.BackgroundTransparency = 0.92
	ring.BorderSizePixel = 0
	ring.ZIndex = 12
	ring.Parent = header
	round(ring)
	local logo = Instance.new("ImageLabel")
	logo.Size = UDim2.new(1, -6, 1, -6)
	logo.Position = UDim2.fromOffset(3, 3)
	logo.BackgroundColor3 = Colors.bg1
	logo.BorderSizePixel = 0
	logo.Image = LOGO_ID
	logo.ScaleType = Enum.ScaleType.Crop
	logo.ZIndex = 13
	logo.Parent = ring
	round(logo)

	local brand = Instance.new("TextLabel")
	brand.BackgroundTransparency = 1
	brand.Position = UDim2.fromOffset(54, 6)
	brand.Size = UDim2.new(1, -54, 0, 18)
	brand.Font = Enum.Font.GothamBold
	brand.TextSize = 12
	brand.TextXAlignment = Enum.TextXAlignment.Left
	brand.TextColor3 = Colors.accent
	brand.Text = "K2  ·  SETUP GUIDE"
	brand.ZIndex = 12
	brand.Parent = header

	local headTitle = Instance.new("TextLabel")
	headTitle.BackgroundTransparency = 1
	headTitle.Position = UDim2.fromOffset(54, 26)
	headTitle.Size = UDim2.new(1, -54, 0, 36)
	headTitle.Font = Enum.Font.GothamBlack
	headTitle.TextSize = 16
	headTitle.TextWrapped = true
	headTitle.TextXAlignment = Enum.TextXAlignment.Left
	headTitle.TextYAlignment = Enum.TextYAlignment.Top
	headTitle.TextColor3 = Colors.white
	headTitle.Text = "Do this to unlock the script"
	headTitle.ZIndex = 12
	headTitle.Parent = header

	local progWrap = Instance.new("Frame")
	progWrap.BackgroundTransparency = 1
	progWrap.Size = UDim2.new(1, 0, 0, 28)
	progWrap.LayoutOrder = 2
	progWrap.ZIndex = 11
	progWrap.Parent = shell

	local stepBadge = Instance.new("TextLabel")
	stepBadge.BackgroundTransparency = 1
	stepBadge.Size = UDim2.new(1, 0, 0, 14)
	stepBadge.Font = Enum.Font.GothamBold
	stepBadge.TextSize = 11
	stepBadge.TextColor3 = Colors.cyan
	stepBadge.TextXAlignment = Enum.TextXAlignment.Left
	stepBadge.Text = "STEP 01  /  06"
	stepBadge.ZIndex = 12
	stepBadge.Parent = progWrap

	local track = Instance.new("Frame")
	track.Position = UDim2.fromOffset(0, 18)
	track.Size = UDim2.new(1, 0, 0, 6)
	track.BackgroundColor3 = Colors.off
	track.BorderSizePixel = 0
	track.ZIndex = 12
	track.Parent = progWrap
	corner(track, 4)
	local fill = Instance.new("Frame")
	fill.Size = UDim2.fromScale(1 / TOTAL, 1)
	fill.BackgroundColor3 = Colors.accent
	fill.BorderSizePixel = 0
	fill.ZIndex = 13
	fill.Parent = track
	corner(fill, 4)
	local fillG = Instance.new("UIGradient")
	fillG.Color = ColorSequence.new(Colors.violet, Colors.cyan)
	fillG.Parent = fill

	local card = Instance.new("Frame")
	card.BackgroundColor3 = Colors.cardHi
	card.BackgroundTransparency = 0.15
	card.BorderSizePixel = 0
	card.Size = UDim2.new(1, 0, 0.52, 0)
	card.LayoutOrder = 3
	card.ZIndex = 11
	card.ClipsDescendants = true
	card.Parent = shell
	corner(card, 14)
	stroke(card, Colors.line, 1, 0.45)
	pcall(function()
		local sc = Instance.new("UISizeConstraint")
		sc.MinSize = Vector2.new(0, 160)
		sc.Parent = card
	end)

	local scroll = Instance.new("ScrollingFrame")
	scroll.Size = UDim2.fromScale(1, 1)
	scroll.BackgroundTransparency = 1
	scroll.BorderSizePixel = 0
	scroll.ScrollBarThickness = 3
	scroll.ScrollBarImageColor3 = Colors.accent
	scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroll.ZIndex = 12
	scroll.Parent = card
	local scrollPad = Instance.new("UIPadding")
	scrollPad.PaddingTop = UDim.new(0, 12)
	scrollPad.PaddingBottom = UDim.new(0, 12)
	scrollPad.PaddingLeft = UDim.new(0, 12)
	scrollPad.PaddingRight = UDim.new(0, 12)
	scrollPad.Parent = scroll
	local scrollLayout = Instance.new("UIListLayout")
	scrollLayout.Padding = UDim.new(0, 8)
	scrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
	scrollLayout.Parent = scroll

	local stepTitle = Instance.new("TextLabel")
	stepTitle.BackgroundTransparency = 1
	stepTitle.Size = UDim2.new(1, 0, 0, 22)
	stepTitle.Font = Enum.Font.GothamBlack
	stepTitle.TextSize = 15
	stepTitle.TextXAlignment = Enum.TextXAlignment.Left
	stepTitle.TextColor3 = Colors.white
	stepTitle.Text = STEPS[1].title
	stepTitle.ZIndex = 13
	stepTitle.LayoutOrder = 1
	stepTitle.Parent = scroll

	local stepBody = Instance.new("TextLabel")
	stepBody.BackgroundTransparency = 1
	stepBody.Size = UDim2.new(1, 0, 0, 0)
	stepBody.AutomaticSize = Enum.AutomaticSize.Y
	stepBody.Font = Enum.Font.Gotham
	stepBody.TextSize = 13
	stepBody.TextWrapped = true
	stepBody.TextXAlignment = Enum.TextXAlignment.Left
	stepBody.TextYAlignment = Enum.TextYAlignment.Top
	stepBody.TextColor3 = Colors.muted
	stepBody.Text = STEPS[1].body
	stepBody.ZIndex = 13
	stepBody.LayoutOrder = 2
	stepBody.Parent = scroll

	local tipLabel = Instance.new("TextLabel")
	tipLabel.BackgroundColor3 = Color3.fromRGB(28, 24, 48)
	tipLabel.Size = UDim2.new(1, 0, 0, 0)
	tipLabel.AutomaticSize = Enum.AutomaticSize.Y
	tipLabel.Font = Enum.Font.GothamMedium
	tipLabel.TextSize = 11
	tipLabel.TextWrapped = true
	tipLabel.TextXAlignment = Enum.TextXAlignment.Left
	tipLabel.TextColor3 = Colors.amber
	tipLabel.Text = "  " .. (STEPS[1].tip or "")
	tipLabel.ZIndex = 13
	tipLabel.LayoutOrder = 3
	tipLabel.Parent = scroll
	corner(tipLabel, 8)
	local tipPad = Instance.new("UIPadding")
	tipPad.PaddingTop = UDim.new(0, 8)
	tipPad.PaddingBottom = UDim.new(0, 8)
	tipPad.PaddingLeft = UDim.new(0, 8)
	tipPad.PaddingRight = UDim.new(0, 8)
	tipPad.Parent = tipLabel

	local linkRow = Instance.new("Frame")
	linkRow.BackgroundTransparency = 1
	linkRow.Size = UDim2.new(1, 0, 0, 64)
	linkRow.Visible = false
	linkRow.LayoutOrder = 4
	linkRow.ZIndex = 13
	linkRow.Parent = scroll
	local linkLbl = Instance.new("TextLabel")
	linkLbl.BackgroundTransparency = 1
	linkLbl.Size = UDim2.new(1, 0, 0, 14)
	linkLbl.Font = Enum.Font.GothamBold
	linkLbl.TextSize = 10
	linkLbl.TextXAlignment = Enum.TextXAlignment.Left
	linkLbl.TextColor3 = Colors.dim
	linkLbl.Text = "TIKTOK PRO INVITE"
	linkLbl.ZIndex = 14
	linkLbl.Parent = linkRow
	local linkBox = Instance.new("TextButton")
	linkBox.Position = UDim2.fromOffset(0, 18)
	linkBox.Size = UDim2.new(1, -88, 0, 36)
	linkBox.BackgroundColor3 = Colors.bg1
	linkBox.AutoButtonColor = false
	linkBox.Font = Enum.Font.Gotham
	linkBox.TextSize = 11
	linkBox.TextTruncate = Enum.TextTruncate.AtEnd
	linkBox.TextXAlignment = Enum.TextXAlignment.Left
	linkBox.TextColor3 = Colors.cyan
	linkBox.Text = "  " .. INVITE_URL
	linkBox.ZIndex = 14
	linkBox.Parent = linkRow
	corner(linkBox, 8)
	stroke(linkBox, Colors.line, 1, 0.4)
	local copyLinkBtn = Instance.new("TextButton")
	copyLinkBtn.Position = UDim2.new(1, -80, 0, 18)
	copyLinkBtn.Size = UDim2.fromOffset(80, 36)
	copyLinkBtn.BackgroundColor3 = Color3.fromRGB(40, 90, 180)
	copyLinkBtn.AutoButtonColor = false
	copyLinkBtn.Font = Enum.Font.GothamBold
	copyLinkBtn.TextSize = 11
	copyLinkBtn.TextColor3 = Colors.white
	copyLinkBtn.Text = "COPY"
	copyLinkBtn.ZIndex = 14
	copyLinkBtn.Parent = linkRow
	corner(copyLinkBtn, 8)

	local discRow = Instance.new("Frame")
	discRow.BackgroundTransparency = 1
	discRow.Size = UDim2.new(1, 0, 0, 48)
	discRow.Visible = false
	discRow.LayoutOrder = 5
	discRow.ZIndex = 13
	discRow.Parent = scroll
	local discBtn = Instance.new("TextButton")
	discBtn.Size = UDim2.new(1, 0, 0, 40)
	discBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
	discBtn.AutoButtonColor = false
	discBtn.Font = Enum.Font.GothamBold
	discBtn.TextSize = 13
	discBtn.TextColor3 = Colors.white
	discBtn.Text = "COPY DISCORD  ·  " .. (SUPPORT_DISCORD:gsub("https://", ""))
	discBtn.ZIndex = 14
	discBtn.Parent = discRow
	corner(discBtn, 10)

	local nav = Instance.new("Frame")
	nav.BackgroundTransparency = 1
	nav.Size = UDim2.new(1, 0, 0, 44)
	nav.LayoutOrder = 4
	nav.ZIndex = 11
	nav.Parent = shell

	local backBtn = Instance.new("TextButton")
	backBtn.Size = UDim2.new(0.32, -4, 1, 0)
	backBtn.BackgroundColor3 = Colors.bg1
	backBtn.AutoButtonColor = false
	backBtn.Font = Enum.Font.GothamBold
	backBtn.TextSize = 13
	backBtn.TextColor3 = Colors.muted
	backBtn.Text = "BACK"
	backBtn.ZIndex = 12
	backBtn.Parent = nav
	corner(backBtn, 10)
	stroke(backBtn, Colors.line, 1, 0.4)

	local nextBtn = Instance.new("TextButton")
	nextBtn.Position = UDim2.new(0.32, 4, 0, 0)
	nextBtn.Size = UDim2.new(0.68, -4, 1, 0)
	nextBtn.BackgroundColor3 = Color3.fromRGB(50, 110, 220)
	nextBtn.AutoButtonColor = false
	nextBtn.Font = Enum.Font.GothamBlack
	nextBtn.TextSize = 14
	nextBtn.TextColor3 = Colors.white
	nextBtn.Text = "NEXT STEP"
	nextBtn.ZIndex = 12
	nextBtn.Parent = nav
	corner(nextBtn, 10)

	local footer = Instance.new("TextLabel")
	footer.BackgroundTransparency = 1
	footer.Size = UDim2.new(1, 0, 0, 16)
	footer.LayoutOrder = 5
	footer.Font = Enum.Font.Gotham
	footer.TextSize = 10
	footer.TextColor3 = Colors.dim
	footer.Text = "K2  ·  follow every step carefully"
	footer.ZIndex = 11
	footer.Parent = shell

	local step, busy = 1, false
	local function flash(btn, ok, kind)
		local orig = btn.Text
		local prev = btn.BackgroundColor3
		btn.Text = ok and (kind == "discord" and "DISCORD COPIED!" or "LINK COPIED!") or "NO CLIPBOARD"
		tw(btn, TweenInfo.new(0.15), { BackgroundColor3 = ok and Colors.green or Colors.red })
		task.delay(1.2, function()
			if not btn.Parent then return end
			btn.Text = orig
			tw(btn, TweenInfo.new(0.2), { BackgroundColor3 = prev })
		end)
	end

	local function setStep(n)
		if busy then return end
		n = math.clamp(n, 1, TOTAL)
		busy = true
		step = n
		local s = STEPS[n]
		stepBadge.Text = string.format("STEP %02d  /  %02d", n, TOTAL)
		stepTitle.Text = s.title
		stepBody.Text = s.body
		tipLabel.Text = "  " .. (s.tip or "")
		linkRow.Visible = s.showLink == true
		discRow.Visible = s.showDiscord == true
		tw(fill, TweenInfo.new(0.35, Enum.EasingStyle.Quart), { Size = UDim2.fromScale(n / TOTAL, 1) })
		backBtn.TextColor3 = n == 1 and Colors.dim or Colors.white
		if n >= TOTAL then
			nextBtn.Text = "FINISH"
			tw(nextBtn, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(40, 160, 100) })
		else
			nextBtn.Text = "NEXT STEP"
			tw(nextBtn, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(50, 110, 220) })
		end
		scroll.CanvasPosition = Vector2.zero
		task.delay(0.15, function() busy = false end)
	end

	copyLinkBtn.MouseButton1Click:Connect(function()
		flash(copyLinkBtn, copyText(INVITE_URL), "link")
	end)
	linkBox.MouseButton1Click:Connect(function()
		flash(copyLinkBtn, copyText(INVITE_URL), "link")
	end)
	discBtn.MouseButton1Click:Connect(function()
		flash(discBtn, copyText(SUPPORT_DISCORD), "discord")
	end)
	nextBtn.MouseButton1Click:Connect(function()
		if busy then return end
		if step < TOTAL then
			setStep(step + 1)
		else
			nextBtn.Text = "RE-EXECUTE SCRIPT"
			tw(nextBtn, TweenInfo.new(0.2), { BackgroundColor3 = Colors.green })
		end
	end)
	backBtn.MouseButton1Click:Connect(function()
		if busy or step <= 1 then return end
		setStep(step - 1)
	end)

	shell.Size = UDim2.new(0.86, 0, 0.84, 0)
	shell.BackgroundTransparency = 0.35
	tw(shell, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0.92, 0, 0.9, 0),
		BackgroundTransparency = 0.08,
	})
	setStep(1)
	print("[Brainrot] Setup tutorial GUI loaded")
end


-- Force show for standalone test
showJoinDiscordGui()
