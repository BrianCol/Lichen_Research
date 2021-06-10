# Read in libraries
library(shiny)
library(shinyjs)
library(shinysky)
library(DT)
library(data.table)
library(lubridate)
library(shinyalert)
useShinyalert()

# Define UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Intermountain West Lichen DNA Reference Library: Working"),
  tags$head(tags$style(HTML('

                            .modal-lg {
                            width: 1200px;
                            }
                            '))),
  helpText("Friendly reminder to save any updates!"),
  br(),
  tags$head(tags$style(".butt{background-color:#230682;} .butt{color: #e6ebef;}")),
  downloadButton("Trich_csv", "Download in CSV", class="butt"),
  useShinyalert(), # Set up shinyalert
  actionButton(inputId = "Updated_trich",label = "Save"),
  uiOutput("MainBody_trich")
))
