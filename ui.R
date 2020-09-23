#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#load("dataframes_short.RData")
#test source("my_prediction.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Next Word Prediction"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput(inputId = "input_text",
                      label = "Input some text", value = "write")

        ),

        # Show a plot of the generated distribution
        mainPanel(
            h4("Next word predicted"),
            verbatimTextOutput(outputId = "output_text")
        )
    )
))
