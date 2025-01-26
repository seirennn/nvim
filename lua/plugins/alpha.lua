return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
                                               ▄ ▄
                                           ▄   ▄▄▄     ▄ ▄▄▄ ▄ 
                                            █ ▄ █▄█ ▄▄▄ █ █▄█ █ █
                                       ▄▄   █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █
                                      ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
                                     █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ 
                                      ▄  █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █
                                  █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █
                                       █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█
  
                                             [  @Seirennn  ]

  “To one who has faith, no explanation is necessary. To one without faith, no explanation is possible.”
                                           ~ St. Thomas Aquinas
    ]]
    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
