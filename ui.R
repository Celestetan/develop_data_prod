library(shiny)
library(httr)

shinyUI(
  fluidPage(    
    titlePanel("Predicted Miles Per Gallon"), 
    textOutput("text1"),
    br(),
    br(),
    
    fluidRow(    
      
      column(8,plotOutput("distPlot")),
      br(),
      br(),
      column(2, 
             numericInput('weight', 'Weight:', 1, min = 1, max = 5, step = 0.5),
             selectInput("cylinders", "Cylinders:", c("4", "6", "8")),
             br(),
             br(),
             submitButton('Calculate')),
      br()  
    )
  )
)