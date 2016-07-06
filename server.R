#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
data(CO2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$co2PlotQ <- renderPlot({
    
    # extract the target dataset
    tempData <- CO2 %>%
                filter(Type == "Quebec" & Treatment == input$treatmentQuebec & Plant == input$plantQuebec)
    
    # draw the histogram with the specified number of bins
    plotTile <- paste("Plant's uptaking CO2 versus concentration in",as.character(tempData$Type)[1], sep=" ")
    ggplot(aes(x=conc, y=uptake), data=tempData) + 
      geom_line(color="blue") + 
      geom_point(color="red",size=3) +
      xlab("Concentration") + 
      ylab("Uptake") + 
      ggtitle(plotTile)
    
  })

  output$co2PlotM <- renderPlot({
    
    # extract the target dataset
    tempData <- CO2 %>%
      filter(Type == "Mississippi" & Treatment == input$treatmentMiss & Plant == input$plantMiss)
    
    # draw the histogram with the specified number of bins
    plotTile <- paste("Plant's uptaking CO2 versus concentration in",as.character(tempData$Type)[1], sep=" ")
    ggplot(aes(x=conc, y=uptake), data=tempData) + 
      geom_line(color="blue") + 
      geom_point(color="red",size=3) +
      xlab("Concentration") + 
      ylab("Uptake") + 
      ggtitle(plotTile)
    
  })
})
