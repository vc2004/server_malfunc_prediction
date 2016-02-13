library(shiny)

shinyUI(fluidPage(
  
    titlePanel("Server Malfunction Rate Prediction"),
    sidebarPanel(
        sliderInput("server", label = h3("Number of Servers"),
                    min = 0, max = 100, value = 50),
        sliderInput("day", label = h3("Number of Days"),
                    min = 0, max = 356, value = 50),
        textOutput("text"),
        h3("No Malfunction Rate:"),
        verbatimTextOutput("zero_rate"),
        h3("One Malfunction Rate:"),
        verbatimTextOutput("one_rate")
    ),
    mainPanel(
        h3("Server Malfunction Rate Prediction"),
        p("The Debian servers installed with Open vSwtich Version 2.4.0 has some bugs 
          interconnect to the Cisco Switch configured with keepalive message.
          Every 10 second, the Cisco Switch will dispatch a keepalive message to
          the server. The server ethernet port uplink will be malfunctioned
          (err-disable) by Cisco Switch if the bug has happened."),
        br(),
        p("The incident logs show there are 8 malfunction records in 22204800
           keepalive message received on Debian servers."),
        br(),
        h3("Let's assuming that:"),
        p("* The keepalive message recieved on servers and malfunction events 
          are iid (independent identically-distributed)" ),
        p("* Server malfunction rate is constant, and it is proportional to 
          keepalive message events." ),
        br(),
        h3("Then we can make prediction based on Poisson Distribution:"),
        p("zero_rate <- ppois(1, lambda*servers*days) -  dpois(1, lambda*server*day)" ),
        p("one_rate <- dpois(1, lambda*servers*days)" )
    )
))
