-- we love SkyTheFloof
task.spawn(
    function()
        while task.wait() do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OnLandFromJump"):FireServer(
                "\226\128\139"
            )
        end
    end
)
while task.wait() do
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("Ascend"):InvokeServer()
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("Rebirth"):InvokeServer()
    for i, v in next, workspace:GetDescendants() do
        if v.Name == "GumdropHitbox" and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bean") then
            game:GetService("Players").LocalPlayer.Character.Bean.CFrame = CFrame.new(v.Position)
            task.wait(0.1)
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("InteractObject"):FireServer(v)
        end
    end
end
