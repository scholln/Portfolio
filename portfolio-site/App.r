library("shiny")
library("rsconnect")



ui <- fluidPage(
  titlePanel("Enter here the allowed amount, submitted amount, copay coinsurance amount and the coinsurance amount"),
  fluidRow(
    column(3, wellPanel(
      numericInput("allwd_amtW", "Allowed amount", value = 0, min = 0, max = 100000),
      numericInput("sbtd_amtW", "Submitted amount", value = 0, min = 0, max = 100000),
      numericInput("copay_coin_amtW", "Copay coinsurance amount", value = 0, min = 0, max = 100000),
      numericInput("ccoin_amtW", "Coinsurance amount", value = 0, min = 0, max = 100000),
      selectInput("State", "Select the State", choices = c("Arizona", "Texas", "California", "Illinois", "New York")),
      submitButton("Submit")
        )
      ),
    column(2, verbatimTextOutput("result1"))
    )
  )

server <- function(input, output){
  state_of_interest <-   reactive({
      Nested_amount_allowed2 %>%
      filter(state_nm  == input$State) %>%
      mutate(values = c(1, input$allwd_amtW, input$sbtd_amtW, input$copay_coin_amtW, input$ccoin_amtW), 
             multiply = abs(estimate * values))
    })
  
      output$result1 <- renderText(state_of_interest() %>%
      summarise(pred = sum(multiply)) %>%
        pull(pred)
      )
  }
    
  

  
  
shinyApp(ui = ui, server = server)
