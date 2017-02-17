# server.R

library(shiny)
source("utilities.R")

shinyServer(
    function(input, output, session) {
        
      
     
      output$words <- renderUI( {
        predictWords <- get_pred(input$input_str)
		
		if (length(predictWords) > 1) {
		predictWordsList <- predictWords[,1]
		predictScores <- predictWords[,2]
        predictWords <- predictWordsList
        }
		
        n <- length(predictWords)
        if( n > 0 ) {
          buttons <- list()
          for(i in 1:n) {
            buttons <- list(buttons, list(
              actionButton(inputId = paste("word",i, sep = ""), label =predictWords[i])
            ))
            
          }
          
          tagList(
            buttons 
          )
        } else {
          tagList("") 
        }
      })
      
      output$Scores <- renderText ({ predictScores() })
      
      observeEvent(input$word1, {
        updateTextInput(session, "input_str", value = paste(input$input_str))
      })
	  
	  observeEvent(input$word2, {
        updateTextInput(session, "input_str", value = paste(input$input_str))
      })
	  
	  observeEvent(input$word3, {
        updateTextInput(session, "input_str", value = paste(input$input_str))
      })
	  
	  observeEvent(input$word4, {
        updateTextInput(session, "input_str", value = paste(input$input_str))
      })
      
     
    }
)