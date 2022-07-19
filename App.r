library("shiny")

deductible <- function(allwd_amt, sbtd_amt, copay_coin_amt, coin_amt){
  
  deductible = 22.95425 + (allwd_amt * 804.88442) + (sbtd_amt * -784.75091) + (copay_coin_amt * -0.02612) + (coin_amt * 0.72997)
  
  return(deductible)
}

ui <- fluidPage(
  titlePanel("Enter here the allowed amount, submitted amount, copay coinsurance amount and the coinsurance amount"),
  fluidRow(
    column(3, wellPanel(
      numericInput("allwd_amtW", "Allowed amount", value = 0, min = 0, max = 100000),
      numericInput("sbtd_amtW", "Submitted amount", value = 0, min = 0, max = 100000),
      numericInput("copay_coin_amtW", "Copay coinsurance amount", value = 0, min = 0, max = 100000),
      numericInput("ccoin_amtW", "Coinsurance amount", value = 0, min = 0, max = 100000),
      submitButton("Submit")
        )
      ),
    column(2, verbatimTextOutput("result1"))
    )
  )

server <- function(input, output){
  
output$result1 <- renderText({
    deductible(input$allwd_amtW, input$sbtd_amtW,  input$copay_coin_amtW, input$ccoin_amtW)
  
    })
  }
  

shinyApp(ui = ui, server = server)
