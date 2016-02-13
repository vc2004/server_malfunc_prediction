library(shiny)

HOURS <- 24
MIN <- 60
SEC <- 60
err <- 8
all_keepalive <- 22204800
lambda <-  err/all_keepalive * (HOURS * MIN * SEC/10)

shinyServer(function(input, output) {
   
    output$zero_rate <- renderPrint({
        zero_rate <- ppois(1, lambda*input$server*input$day) -  
            dpois(1, lambda*input$server*input$day)
        zero_rate
    })
    
    output$one_rate <- renderPrint({
        one_rate <-  dpois(1, lambda*input$server*input$day)
        one_rate
    })
    
    output$text <- renderText({
        text <-  paste("for ", input$server, "servers in ", input$day, " days")
        text
    })
})
