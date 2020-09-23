#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
# load the file into new environment and get it from there
e = new.env()
name <- load("dataframes_short.RData", envir = e)
df_bi_5 <- e$df_bi_5
df_uni_10 <- e$df_uni_10
df_tri_2 <- e$df_tri_2
df_tet_2 <- e$df_tet_2

#load("dataframes_short.RData")
source("my_prediction.R")

#load(file = file.path(getwd(),"dataframes_short.RData"))
#source("my_prediction.R")

shinyServer(function(input, output) {
    next_w <- reactive({
        as.character(my_prediction(input$input_text))
    })
    
    output$output_text <- next_w
    
})