# Load needed libraries
library("shiny")
library("bslib")
library("tidyverse")

# Load needed functions
source(file = "app_functions.R")

# Run the frontend user interface ui.R
source(file = "UI.R")

# Run the backend server server.R
source(file = "server.R")

# Run the Shiny app
shinyApp(ui = ui, server = server)
