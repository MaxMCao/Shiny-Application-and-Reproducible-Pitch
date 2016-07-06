#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Peer Graded Assignment: Course Project: Shiny Application and Reproducible Pitch"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h2("Plants in Quebec"),
      p("Choose different plant with different treatments in Quebec."),
      
      selectInput("treatmentQuebec",
                  label = "Choose the treatment in Quebec:",
                  choices = unique(as.character(CO2[CO2$Type==unique(as.character(CO2$Type))[1],3]))), 
      selectInput("plantQuebec",
                   label = "Select a plant in Quebec:",
                   choices = unique(as.character(CO2[CO2$Type==unique(as.character(CO2$Type))[1],1]))),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      
      h2("Plants in Mississippi"),
      p("Choose different plant with different treatments in Mississippi."),
      selectInput("treatmentMiss",
                  label = "Choose the treatment in Mississippi:",
                  choices = unique(as.character(CO2[CO2$Type==unique(as.character(CO2$Type))[2],3]))), 
      selectInput("plantMiss",
                  label = "Select a plant in Mississippi:",
                  choices = unique(as.character(CO2[CO2$Type==unique(as.character(CO2$Type))[2],1])))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h1("Introduction"),
       p("These figures show the change of plants' uptaking CO2 depending on the concentrations in Quebec and Mississippi.
          The CO2 uptake of six plants from Quebec and six plants from Mississippi was measured at several levels of 
          ambient CO2 concentration. Half the plants of each type were chilled overnight before the experiment was conducted."),
       p("OVerall, the uptakes of CO2 by plants increase when the conentration of CO2 increases."),
      
       plotOutput("co2PlotQ"),
       
       plotOutput("co2PlotM")
    )
  )
))
