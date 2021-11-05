Player = game.Players.pi3dot14
Character = Player.Character
Character.Archivable = true
for _,p in ipairs(Character:GetDescendants()) do
	if (p:IsA("Decal")) then
		p.Archivable = false
	end
end
copies = {}
while (Character.Humanoid.Health > 0) do
	local copy = Character:Clone(workspace)
	for _,p in ipairs(copy:GetDescendants()) do
		if (p:IsA("BasePart")) then
			p.Anchored = true
		elseif (p:IsA("Humanoid") or p:IsA("Script") or p:IsA("LocalScript")) then
			p:Destroy()
		end
	end
	table.insert(copies, copy)
	wait(0.1)
	for _,c in ipairs(copies) do
		local apt = true
		for _,p in ipairs(c:GetDescendants()) do

			if (p:IsA("BasePart")) then
				p.Transparency = p.Transparency - 0.1
				if (p.Transparency > 0) then
					apt = false
				end
			end
		end
		if (apt) then
			copy:Destroy()
		end
	end
end
