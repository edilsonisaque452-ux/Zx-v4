-- ZX EXTERNAL v4 | UNIVERSAL — todos os jogos Roblox
-- cola no Delta Executor e executa
-- bola vermelha no canto → clica pra abrir

local Players=game:GetService("Players")
local RS=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local TS=game:GetService("TweenService")
local lp=Players.LocalPlayer
local mouse=lp:GetMouse()
local cam=workspace.CurrentCamera

-- ANTI DETECT
pcall(function()
    local mt=getrawmetatable(game)
    local old=mt.__namecall
    setreadonly(mt,false)
    mt.__namecall=newcclosure(function(self,...)
        local m=getnamecallmethod()
        if m=="FireServer" then
            local a=tostring(select(1,...))
            if a:lower():find("detect") or a:lower():find("cheat") or a:lower():find("report") then return end
        end
        return old(self,...)
    end)
    setreadonly(mt,true)
end)

-- NOTIFY
local function notify(msg)
    local sg2=Instance.new("ScreenGui",game.CoreGui); sg2.ResetOnSpawn=false
    local f=Instance.new("Frame",sg2)
    f.Size=UDim2.new(0,300,0,44); f.Position=UDim2.new(0.5,-150,1,-20)
    f.BackgroundColor3=Color3.fromRGB(10,0,0); f.BorderSizePixel=0
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,10)
    local s=Instance.new("UIStroke",f); s.Color=Color3.fromRGB(200,0,40); s.Thickness=1.5
    local l=Instance.new("TextLabel",f); l.Size=UDim2.new(1,0,1,0); l.BackgroundTransparency=1
    l.Text="⚡ "..msg; l.TextColor3=Color3.fromRGB(255,60,80); l.TextScaled=true; l.Font=Enum.Font.GothamBold; l.ZIndex=2
    TS:Create(f,TweenInfo.new(.3),{Position=UDim2.new(0.5,-150,1,-70)}):Play()
    task.delay(2.5,function() TS:Create(f,TweenInfo.new(.3),{Position=UDim2.new(0.5,-150,1,-20)}):Play(); task.wait(.3); sg2:Destroy() end)
end

-- GUI
local sg=Instance.new("ScreenGui",game.CoreGui); sg.Name="ZXv4"; sg.ResetOnSpawn=false; sg.IgnoreGuiInset=true

-- PARTÍCULAS
for i=1,35 do
    local p=Instance.new("TextLabel",sg); p.Text="*"; p.TextColor3=Color3.fromRGB(180,0,0)
    p.BackgroundTransparency=1; p.TextSize=math.random(8,14); p.ZIndex=1
    p.Position=UDim2.new(math.random(0,100)/100,0,-0.05,0); p.Size=UDim2.new(0,16,0,16)
    local spd=math.random(3,7); local dr=(math.random(-6,6))/1000
    RS.Heartbeat:Connect(function(dt)
        p.Position=UDim2.new(p.Position.X.Scale+dr,0,p.Position.Y.Scale+dt/spd,0)
        if p.Position.Y.Scale>1.05 then p.Position=UDim2.new(math.random(0,100)/100,0,-0.05,0) end
    end)
end

-- BOLA
local orb=Instance.new("TextButton",sg)
orb.Size=UDim2.new(0,54,0,54); orb.Position=UDim2.new(1,-70,1,-80)
orb.BackgroundColor3=Color3.fromRGB(120,0,0); orb.Text="⚡"; orb.TextScaled=true
orb.Font=Enum.Font.GothamBold; orb.BorderSizePixel=0; orb.ZIndex=200
Instance.new("UICorner",orb).CornerRadius=UDim.new(0,99)
local os=Instance.new("UIStroke",orb); os.Color=Color3.fromRGB(255,0,40); os.Thickness=2
TS:Create(os,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),{Thickness=4}):Play()

-- PAINEL
local main=Instance.new("Frame",sg)
main.Size=UDim2.new(0,330,0,540); main.Position=UDim2.new(1,-400,1,-630)
main.BackgroundColor3=Color3.fromRGB(5,0,0); main.BorderSizePixel=0; main.ZIndex=10; main.Visible=false
Instance.new("UICorner",main).CornerRadius=UDim.new(0,14)
local mstr=Instance.new("UIStroke",main); mstr.Color=Color3.fromRGB(180,0,0); mstr.Thickness=1.5

-- SCANLINE
task.spawn(function()
    while true do
        for y=0,540,3 do
            local sl=Instance.new("Frame",main); sl.Size=UDim2.new(1,0,0,1)
            sl.Position=UDim2.new(0,0,0,y); sl.BackgroundColor3=Color3.fromRGB(200,0,0)
            sl.BackgroundTransparency=.88; sl.BorderSizePixel=0; sl.ZIndex=15
            task.wait(0.003); sl:Destroy()
        end; task.wait(5)
    end
end)

-- HEADER
local hdr=Instance.new("Frame",main)
hdr.Size=UDim2.new(1,0,0,50); hdr.BackgroundColor3=Color3.fromRGB(100,0,0); hdr.BorderSizePixel=0; hdr.ZIndex=11
Instance.new("UICorner",hdr).CornerRadius=UDim.new(0,14)
local tit=Instance.new("TextLabel",hdr); tit.Size=UDim2.new(1,-44,0,28); tit.Position=UDim2.new(0,12,0,4)
tit.BackgroundTransparency=1; tit.Text="⚡ ZX EXTERNAL v4 — UNIVERSAL"
tit.TextColor3=Color3.new(1,1,1); tit.TextScaled=true; tit.Font=Enum.Font.GothamBold; tit.ZIndex=12
local sub=Instance.new("TextLabel",hdr); sub.Size=UDim2.new(1,0,0,14); sub.Position=UDim2.new(0,12,1,-17)
sub.BackgroundTransparency=1; sub.Text="by @odil9 • discord.gg/xGDFJ29MmA"
sub.TextColor3=Color3.fromRGB(255,100,100); sub.TextSize=9; sub.Font=Enum.Font.Gotham; sub.ZIndex=12
local minB=Instance.new("TextButton",hdr)
minB.Size=UDim2.new(0,28,0,28); minB.Position=UDim2.new(1,-36,0,11)
minB.BackgroundColor3=Color3.fromRGB(60,0,0); minB.Text="−"; minB.TextColor3=Color3.new(1,1,1)
minB.TextScaled=true; minB.Font=Enum.Font.GothamBold; minB.ZIndex=13
Instance.new("UICorner",minB).CornerRadius=UDim.new(0,6)

-- STATUS
local statF=Instance.new("Frame",main); statF.Size=UDim2.new(1,0,0,18); statF.Position=UDim2.new(0,0,0,50)
statF.BackgroundColor3=Color3.fromRGB(12,0,0); statF.BorderSizePixel=0; statF.ZIndex=11
local statL=Instance.new("TextLabel",statF); statL.Size=UDim2.new(1,-8,1,0); statL.Position=UDim2.new(0,8,0,0)
statL.BackgroundTransparency=1; statL.Text="● ONLINE  ● UNIVERSAL  ● ANTI-DETECT ON"
statL.TextColor3=Color3.fromRGB(180,0,0); statL.TextSize=9; statL.Font=Enum.Font.GothamBold
statL.ZIndex=12; statL.TextXAlignment=Enum.TextXAlignment.Left

-- TABS BAR
local tabBar=Instance.new("Frame",main); tabBar.Size=UDim2.new(1,0,0,28); tabBar.Position=UDim2.new(0,0,0,68)
tabBar.BackgroundColor3=Color3.fromRGB(8,0,0); tabBar.BorderSizePixel=0; tabBar.ZIndex=11
local tabScroll=Instance.new("ScrollingFrame",tabBar); tabScroll.Size=UDim2.new(1,0,1,0)
tabScroll.BackgroundTransparency=1; tabScroll.ScrollBarThickness=0; tabScroll.ZIndex=12
local tabLay=Instance.new("UIListLayout",tabScroll); tabLay.FillDirection=Enum.FillDirection.Horizontal; tabLay.SortOrder=Enum.SortOrder.LayoutOrder

-- CONTENT
local scroll=Instance.new("ScrollingFrame",main)
scroll.Size=UDim2.new(1,-4,1,-100); scroll.Position=UDim2.new(0,2,0,98)
scroll.BackgroundTransparency=1; scroll.BorderSizePixel=0
scroll.ScrollBarThickness=3; scroll.ScrollBarImageColor3=Color3.fromRGB(160,0,0); scroll.ZIndex=11
local cLay=Instance.new("UIListLayout",scroll); cLay.Padding=UDim.new(0,5); cLay.SortOrder=Enum.SortOrder.LayoutOrder
local cPad=Instance.new("UIPadding",scroll)
cPad.PaddingLeft=UDim.new(0,6); cPad.PaddingRight=UDim.new(0,6); cPad.PaddingTop=UDim.new(0,6)

-- HELPERS
local function clr() for _,v in pairs(scroll:GetChildren()) do if not v:IsA("UIListLayout") and not v:IsA("UIPadding") then v:Destroy() end end end
local function updCanvas() scroll.CanvasSize=UDim2.new(0,0,0,cLay.AbsoluteContentSize.Y+20) end
local function sec(n) local f=Instance.new("Frame",scroll); f.Size=UDim2.new(1,0,0,18); f.BackgroundTransparency=1; f.ZIndex=12; local l=Instance.new("TextLabel",f); l.Size=UDim2.new(1,0,1,0); l.BackgroundTransparency=1; l.Text="── "..n.." ──"; l.TextColor3=Color3.fromRGB(200,0,40); l.TextSize=9; l.Font=Enum.Font.GothamBold; l.ZIndex=12 end
local states={}
local function tog(name,onMsg,offMsg,cb)
    local f=Instance.new("Frame",scroll); f.Size=UDim2.new(1,0,0,42); f.BackgroundColor3=Color3.fromRGB(14,0,0); f.BorderSizePixel=0; f.ZIndex=12
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,8)
    local fs=Instance.new("UIStroke",f); fs.Color=Color3.fromRGB(40,0,0); fs.Thickness=1
    local lbl=Instance.new("TextLabel",f); lbl.Size=UDim2.new(1,-54,1,0); lbl.Position=UDim2.new(0,10,0,0)
    lbl.BackgroundTransparency=1; lbl.Text=name; lbl.TextColor3=Color3.fromRGB(200,150,150)
    lbl.TextSize=11; lbl.Font=Enum.Font.GothamBold; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.ZIndex=12
    local sw=Instance.new("TextButton",f); sw.Size=UDim2.new(0,44,0,22); sw.Position=UDim2.new(1,-52,0.5,-11)
    sw.BackgroundColor3=Color3.fromRGB(30,0,0); sw.Text="OFF"; sw.TextColor3=Color3.fromRGB(100,0,0)
    sw.TextSize=9; sw.Font=Enum.Font.GothamBold; sw.ZIndex=13
    Instance.new("UICorner",sw).CornerRadius=UDim.new(0,99)
    states[name]=false
    sw.MouseButton1Click:Connect(function()
        states[name]=not states[name]; local on=states[name]
        sw.BackgroundColor3=on and Color3.fromRGB(160,0,0) or Color3.fromRGB(30,0,0)
        sw.Text=on and "ON" or "OFF"; sw.TextColor3=on and Color3.new(1,1,1) or Color3.fromRGB(100,0,0)
        fs.Color=on and Color3.fromRGB(160,0,0) or Color3.fromRGB(40,0,0)
        notify(on and onMsg or offMsg); if cb then pcall(cb,on) end
    end)
end
local function btn(label,cb) local b=Instance.new("TextButton",scroll); b.Size=UDim2.new(1,0,0,36); b.BackgroundColor3=Color3.fromRGB(80,0,0); b.Text=label; b.TextColor3=Color3.new(1,1,1); b.TextScaled=true; b.Font=Enum.Font.GothamBold; b.BorderSizePixel=0; b.ZIndex=12; Instance.new("UICorner",b).CornerRadius=UDim.new(0,8); b.MouseButton1Click:Connect(function() pcall(cb) end) end
local nickRef={}
local function inp(ph) local b=Instance.new("TextBox",scroll); b.Size=UDim2.new(1,0,0,34); b.BackgroundColor3=Color3.fromRGB(14,0,0); b.PlaceholderText=ph; b.Text=""; b.TextColor3=Color3.new(1,1,1); b.PlaceholderColor3=Color3.fromRGB(80,0,0); b.TextScaled=true; b.Font=Enum.Font.Gotham; b.BorderSizePixel=0; b.ZIndex=12; Instance.new("UICorner",b).CornerRadius=UDim.new(0,8); Instance.new("UIStroke",b).Color=Color3.fromRGB(60,0,0); return b end

-- ── PAGES ─────────────────────────────────────────────────────────

local function pageMove()
    clr(); sec("VELOCIDADE")
    tog("Speed Hack","Speed ON","Speed OFF",function(on) local h=lp.Character and lp.Character:FindFirstChild("Humanoid"); if h then h.WalkSpeed=on and 100 or 16 end end)
    tog("Super Speed","Super Speed ON","Super Speed OFF",function(on) local h=lp.Character and lp.Character:FindFirstChild("Humanoid"); if h then h.WalkSpeed=on and 250 or 16 end end)
    tog("Fly","Fly ON","Fly OFF",function(on)
        local c=lp.Character; if not c then return end; local hrp=c:FindFirstChild("HumanoidRootPart"); if not hrp then return end
        if on then
            local bv=Instance.new("BodyVelocity",hrp); bv.Name="ZXFly"; bv.MaxForce=Vector3.new(1e9,1e9,1e9)
            RS.Heartbeat:Connect(function()
                if not states["Fly"] then return end
                local v=Vector3.zero
                if UIS:IsKeyDown(Enum.KeyCode.W) then v=v+cam.CFrame.LookVector*80 end
                if UIS:IsKeyDown(Enum.KeyCode.S) then v=v-cam.CFrame.LookVector*80 end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then v=v+Vector3.new(0,60,0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then v=v-Vector3.new(0,60,0) end
                bv.Velocity=v
            end)
        else local bv=hrp:FindFirstChild("ZXFly"); if bv then bv:Destroy() end end
    end)
    tog("Noclip","Noclip ON","Noclip OFF",function(on) RS.Stepped:Connect(function() if not states["Noclip"] then return end; local c=lp.Character; if not c then return end; for _,v in pairs(c:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end) end)
    tog("Infinite Jump","Inf Jump ON","Inf Jump OFF",function(on) UIS.JumpRequest:Connect(function() if states["Infinite Jump"] and lp.Character then lp.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end end) end)
    tog("High Jump","High Jump ON","High Jump OFF",function(on) local h=lp.Character and lp.Character:FindFirstChild("Humanoid"); if h then h.JumpPower=on and 150 or 50 end end)
    tog("Low Gravity","Low Grav ON","Low Grav OFF",function(on) workspace.Gravity=on and 10 or 196 end)
    tog("No Clip Walls","Wall Clip ON","Wall Clip OFF")
    sec("TELEPORTE")
    btn("📍 TP Mouse — pressiona T",function() notify("Pressiona T pra teleportar") end)
    btn("🧍 TP Jogador mais próximo",function()
        local closest,dist=nil,9999
        for _,p in pairs(Players:GetPlayers()) do
            if p~=lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local d=(lp.Character.HumanoidRootPart.Position-p.Character.HumanoidRootPart.Position).Magnitude
                if d<dist then dist=d; closest=p end
            end
        end
        if closest then lp.Character.HumanoidRootPart.CFrame=closest.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,4); notify("TP: "..closest.Name) end
    end)
    btn("🏠 TP Spawn",function() lp.Character.HumanoidRootPart.CFrame=CFrame.new(0,10,0); notify("TP Spawn!") end)
    btn("🎯 TP Objetivo/Flag/Goal",function()
        for _,v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("flag") or v.Name:lower():find("goal") or v.Name:lower():find("checkpoint") or v.Name:lower():find("objective") then
                local bp=v:FindFirstChildWhichIsA("BasePart") or (v:IsA("BasePart") and v)
                if bp then lp.Character.HumanoidRootPart.CFrame=CFrame.new(bp.Position+Vector3.new(0,5,0)); notify("TP: "..v.Name); return end
            end
        end; notify("Nenhum objetivo encontrado")
    end)
    btn("📦 TP Chest/Baú/Caixa",function()
        for _,v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("chest") or v.Name:lower():find("box") or v.Name:lower():find("crate") or v.Name:lower():find("treasure") then
                local bp=v:FindFirstChildWhichIsA("BasePart")
                if bp then lp.Character.HumanoidRootPart.CFrame=CFrame.new(bp.Position+Vector3.new(0,3,0)); notify("TP: "..v.Name); return end
            end
        end; notify("Nenhum baú encontrado")
    end)
    UIS.InputBegan:Connect(function(i,gpe) if gpe then return end; if i.KeyCode==Enum.KeyCode.T and lp.Character then lp.Character.HumanoidRootPart.CFrame=CFrame.new(mouse.Hit.Position+Vector3.new(0,3,0)); notify("TP Mouse!") end end)
    updCanvas()
end

local function pageCombat()
    clr(); sec("DEFESA")
    tog("God Mode","GOD — IMORTAL","God Mode OFF",function(on) local h=lp.Character and lp.Character:FindFirstChild("Humanoid"); if h then h.MaxHealth=on and math.huge or 100; h.Health=on and math.huge or 100 end end)
    tog("Anti Ragdoll","Anti Ragdoll ON","Anti Ragdoll OFF")
    tog("No Knockback","No KB ON","No KB OFF",function(on)
        local c=lp.Character; if not c then return end
        if on then local bg=Instance.new("BodyGyro",c.HumanoidRootPart); bg.Name="ZXBG"; bg.MaxTorque=Vector3.new(1e9,1e9,1e9) else local bg=c.HumanoidRootPart:FindFirstChild("ZXBG"); if bg then bg:Destroy() end end
    end)
    tog("Anti Stun","Anti Stun ON","Anti Stun OFF")
    sec("ATAQUE")
    tog("Kill Aura","Kill Aura ON","Kill Aura OFF",function(on)
        RS.Heartbeat:Connect(function()
            if not states["Kill Aura"] then return end
            local c=lp.Character; if not c then return end; local hrp=c:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            for _,p in pairs(Players:GetPlayers()) do
                if p~=lp and p.Character then
                    local ph=p.Character:FindFirstChild("HumanoidRootPart"); local hm=p.Character:FindFirstChild("Humanoid")
                    if ph and hm and (hrp.Position-ph.Position).Magnitude<20 then hm:TakeDamage(99) end
                end
            end
        end)
    end)
    tog("Kill Aura Mobs","Mob Aura ON","Mob Aura OFF",function(on)
        RS.Heartbeat:Connect(function()
            if not states["Kill Aura Mobs"] then return end
            local c=lp.Character; if not c then return end; local hrp=c:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            for _,v in pairs(workspace:GetDescendants()) do
                if v:IsA("Humanoid") and v.Parent~=lp.Character and (hrp.Position-(v.Parent:FindFirstChild("HumanoidRootPart") and v.Parent.HumanoidRootPart.Position or hrp.Position)).Magnitude<25 then v:TakeDamage(99) end
            end
        end)
    end)
    tog("One Hit Kill","One Hit ON","One Hit OFF")
    tog("Infinite Ammo","Inf Ammo ON","Inf Ammo OFF")
    tog("No Recoil","No Recoil ON","No Recoil OFF")
    tog("Rapid Fire","Rapid Fire ON","Rapid Fire OFF")
    sec("AÇÕES")
    btn("⚔️ Pegar arma mais próxima",function()
        for _,v in pairs(workspace:GetDescendants()) do if v:IsA("Tool") then v.Parent=lp.Backpack; notify("Arma: "..v.Name); return end end; notify("Nenhuma arma no mapa")
    end)
    btn("💀 Kill All players",function() for _,p in pairs(Players:GetPlayers()) do if p~=lp and p.Character and p.Character:FindFirstChild("Humanoid") then p.Character.Humanoid.Health=0 end end; notify("Kill All!") end)
    btn("🏃 TP pro mob/inimigo mais próximo",function()
        local closest,dist=nil,9999
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v~=lp.Character then
                local hrp=v:FindFirstChild("HumanoidRootPart"); if not hrp then continue end
                local d=(lp.Character.HumanoidRootPart.Position-hrp.Position).Magnitude
                if d<dist then dist=d; closest=hrp end
            end
        end
        if closest then lp.Character.HumanoidRootPart.CFrame=CFrame.new(closest.Position+Vector3.new(0,3,2)); notify("TP mob!") end
    end)
    updCanvas()
end

local function pageItems()
    clr(); sec("AUTO FARM")
    tog("Auto Farm Mobs","Auto Farm ON","Auto Farm OFF",function(on)
        task.spawn(function()
            while states["Auto Farm Mobs"] do
                for _,v in pairs(workspace:GetDescendants()) do
                    if not states["Auto Farm Mobs"] then break end
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v~=lp.Character then
                        local hrp=v:FindFirstChild("HumanoidRootPart"); if hrp then lp.Character.HumanoidRootPart.CFrame=CFrame.new(hrp.Position+Vector3.new(0,2,2)); task.wait(0.15) end
                    end
                end; task.wait(0.5)
            end
        end)
    end)
    tog("Auto Collect Items","Auto Collect ON","Auto Collect OFF",function(on)
        task.spawn(function()
            while states["Auto Collect Items"] do
                for _,v in pairs(workspace:GetDescendants()) do
                    if not states["Auto Collect Items"] then break end
                    if v:IsA("BasePart") then
                        local n=v.Name:lower()
                        if n:find("coin") or n:find("gem") or n:find("cash") or n:find("money") or n:find("drop") or n:find("item") or n:find("collect") or n:find("pickup") or n:find("loot") or n:find("reward") then
                            lp.Character.HumanoidRootPart.CFrame=CFrame.new(v.Position); task.wait(0.05)
                        end
                    end
                end; task.wait(1)
            end
        end)
    end)
    tog("Auto Collect Chest","Chest ON","Chest OFF",function(on)
        task.spawn(function()
            while states["Auto Collect Chest"] do
                for _,v in pairs(workspace:GetDescendants()) do
                    if not states["Auto Collect Chest"] then break end
                    if v.Name:lower():find("chest") or v.Name:lower():find("box") or v.Name:lower():find("crate") or v.Name:lower():find("treasure") then
                        local bp=v:FindFirstChildWhichIsA("BasePart"); if bp then lp.Character.HumanoidRootPart.CFrame=CFrame.new(bp.Position); task.wait(0.3) end
                    end
                end; task.wait(2)
            end
        end)
    end)
    tog("Auto Quest","Auto Quest ON","Auto Quest OFF")
    sec("PEGAR ITENS")
    local itemNames={"💰 Coin/Moeda","💎 Gem/Pedra","💵 Cash/Dinheiro","🗝️ Key/Chave","📦 Chest/Baú","❤️ HealthKit","🔫 AmmoBox","⭐ StarGem","🔮 Crystal","💠 Diamond","🥇 Gold","🥈 Silver","🥚 Egg","🍎 Fruit","🌱 Seed","🪵 Wood","🪨 Stone","⛏️ Ore","🐟 Fish","🍖 Meat","🎖️ Badge","🏆 Trophy","🎁 Present","🔑 Keycard","💉 Potion","🛡️ Shield","⚡ Energy","🌟 Stardust","🧪 Chemical","🎯 Target","🍄 Mushroom","🌀 Orb","🪙 Token","💫 Sparkle","🔩 Screw","🧲 Magnet","🌊 Wate
