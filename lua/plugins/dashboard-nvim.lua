return {
  "nvimdev/dashboard-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VimEnter",
  config = function()
    local logo = [[



           ______________________           
          /\  ________  ________ \          
         /  \ \______/\ \______/\ \         
        / /\ \ \  / /\ \ \  / /\ \ \        
       / / /\ \ \/ / /\ \ \/ / /\ \ \       
      / / /__\ \ \/_/__\_\ \/_/__\_\ \      
     / /_/____\ \  ________  ________ \     
    /  \ \____/  \ \______/\ \______/\ \    
   / /\ \ \  / /\ \ \  / /\ \ \  / /\ \ \   
  / / /\ \ \/ / /\ \ \/ / /\ \ \/ / /\ \ \  
 / / /__\ \/ / /__\ \ \/_/__\_\ \/_/__\_\ \ 
/ /_/___ \  /_/____\ \_____________________\
\ \ \____/  \ \____/ / _______   _______   /
 \ \ \  / /\ \ \  / / /\ \  / / /\ \  / / / 
  \ \ \/ / /\ \ \/ / /\ \ \/ / /\ \ \/ / /  
   \ \/ / /__\ \/ / /__\_\/ / /__\_\/ / /   
    \  /_/____\  / /______\/ /______\/ /    
     \ \ \____/ / ________  ________  /     
      \ \ \  / / /\ \  / / /\ \  / / /      
       \ \ \/ / /\ \ \/ / /\ \ \/ / /       
        \ \/ / /__\_\/ / /__\_\/ / /        
         \  / /______\/ /______\/ /         
          \/_____________________/          


    ]]

    require("dashboard").setup {
      theme = "doom",
      hide = {
        statusline = true,
        winbar = true,
        tabline = true,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          { action = "Telescope find_files", desc = "Find files", icon = " ", key = "f" },
          { action = "Telescope oldfiles", desc = "Recent files", icon = " ", key = "r" },
          { action = "Telescope live_grep", desc = "Find text", icon = " ", key = "g" },
          { action = "Telescope workspaces", desc = "Projects", icon = "󰅨 ", key = "p" },
          { action = "Lazy", desc = "Lazy", icon = "󰒲 ", key = "l" },
          { action = "qa", desc = "Quit", icon = " ", key = "q" },
        },
        disable_move = true,
      },
    }
  end
}
