do
GB.Info:AddLabel("PhiPhai v3\nBuilt and test")
GB.Info:AddButton({
    Text = "Copy Discord Invite",
    Func = function()
        local link = "https://discord.gg/6y7TpYTBkW"
        if setclipboard then
            setclipboard(link)
        elseif toclipboard then
            toclipboard(link)
        end
        Notify("Discord", "Invite link copied", 3)
    end,
})
end
