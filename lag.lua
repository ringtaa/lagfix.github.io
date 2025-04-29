for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("ParticleEmitter") or obj:IsA("Light") or obj:IsA("Beam") or obj:IsA("Decal") then
        obj:Destroy() -- Remove resource-heavy effects
    end
end

game.Lighting.GlobalShadows = false -- Disable shadows
game.Lighting.Brightness = 1 -- Lower brightness for performance
game.Lighting.Ambient = Color3.new(1, 1, 1) -- Simplify lighting

-- Reduce texture quality
for _, mesh in pairs(workspace:GetDescendants()) do
    if mesh:IsA("MeshPart") then
        mesh.TextureID = "" -- Remove textures for less GPU demand
    end
end
