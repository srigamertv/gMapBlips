Config = {}

Config.Makers = {
    Prison = {
        Label = "Prison", -- Nome do blip
        Color = 1, -- https://docs.fivem.net/docs/game-references/blips/
        Type = 189, -- https://docs.fivem.net/docs/game-references/blips/
        Size = 1.0, -- Tamanho padrão 1.0
        Radius = 100.0, -- Tamanho do círculo ao redor do blip
        Pos = vector3( 1745.8464, 2605.9673, 45.5650 ), -- x, y, z
        RequirePermission = true, -- Define se precisa de permissão para ver o blip
        Permission = "manager.permissao" -- Permissão necessária para ver o blip
    },

    teste = {
        Label = "teste", -- Nome do blip
        Color = 1, -- https://docs.fivem.net/docs/game-references/blips/
        Type = 189, -- https://docs.fivem.net/docs/game-references/blips/
        Size = 1.0, -- Tamanho padrão 1.0
        Radius = 100.0, -- Tamanho do círculo ao redor do blip
        Pos = vector3( 1715.99, 2216.52, 81.72 ), -- x, y, z
        RequirePermission = false, -- Define se precisa de permissão para ver o blip
        Permission = "manager.permissao" -- Permissão necessária para ver o blip
    },

    -- Adicione mais blips aqui conforme necessário para você
}
