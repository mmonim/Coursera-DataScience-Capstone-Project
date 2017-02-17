#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)

shinyUI(fluidPage(
  
     headerPanel("Word Predictor"
     ),
     
     sidebarPanel(
       h2("Introduction"),
       p("This application predicts the next possible word(s) in a phrase or sentence. To use it, simply type word(s) on the text field on the screen
          and up to 4 possible next words will be displayed.")
      
       
       ),
     
     
     
     mainPanel(
       
	   
	     
       textInput("input_str", "Enter your sentence - type words:", width = "90%"),
       
       br(),
       h4("Predicted words"),
	   uiOutput("words"),
       br(),
	   
	    h3(textOutput("scores"))
      
       
       
     )
)) 
     
  
  