local player = game.Players.LocalPlayer

function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = "@everyone",
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["color"] = embed.color,
                ["author"] = {
                    ["name"] = embed.author.name,
                },
                ["fields"] = embed.fields,
                ["thumbnail"] = {
                    ["url"] = embed.thumbnail.url
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

local embed = {
    ["title"] = player.name ..  " ready!",
    ["color"] = 16645629,
    ["author"] = {
        ["name"] = "Halal Hub"
    },
    ["thumbnail"] = {
        ["url"] = "https://i.pinimg.com/originals/a0/f8/06/a0f8069036f633673336b980c762086d.png"
    }
}
SendMessageEMBED(url, embed)
