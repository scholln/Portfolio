library("shiny")

deductible <- function(allwd_amt, sbtd_amt, copay_coin_amt, coin_amt){
  
  deductible = 22.95425 + (allwd_amt * 804.88442) + (sbtd_amt * -784.75091) + (copay_coin_amt * -0.02612) + (coin_amt * 0.72997)
  
  return(deductible)
}

deductible_New_York <- function(allwd_amt, sbtd_amt, copay_coin_amt, coin_amt){
  
  deductible = 2.688e+01 + (allwd_amt *  1.405e+03) + (sbtd_amt * -1.370e+03) + (copay_coin_amt * 4.553e-01) + (coin_amt * 4.489e-02)
  
  return(deductible)
}

deductible_Illinois <- function(allwd_amt, sbtd_amt, copay_coin_amt, coin_amt){
  
  deductible = 13.04702 + (allwd_amt *  724.14601) + (sbtd_amt * -706.02762) + (copay_coin_amt * -0.03729) + (coin_amt * 1.09490)
  
  return(deductible)
}

deductible_Arizona <- function(allwd_amt, sbtd_amt, copay_coin_amt, coin_amt){
  
  deductible = 0.1280909 + (allwd_amt *  148.8685) + (sbtd_amt * -6.6826764) + (copay_coin_amt * -0.0004278) + (coin_amt * 0.0026185)
  
  return(deductible)
}

deductible_Texas <- function(allwd_amt, sbtd_amt, copay_coin_amt, coin_amt){
  
  deductible = 56.5658 + (allwd_amt *  148.8685) + (sbtd_amt * -145.1775) + (copay_coin_amt * -0.0570) + (coin_amt * 0.3753)
  
  return(deductible)
}

deductible_California <- function(allwd_amt, sbtd_amt, copay_coin_amt, coin_amt){
  
  deductible = 76.8014 + (allwd_amt *  4243.6768) + (sbtd_amt * -4137.5039) + (copay_coin_amt * -0.4802) + (coin_amt * -0.2482)
  
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
      selectInput("State", "Select the State", choices = c("Arizona", "Texas", "California", "Illinois", "New York")),
      submitButton("Submit")
        )
      ),
    column(2, verbatimTextOutput("result1"))
    )
  )

server <- function(input, output){
  observeEvent({
    c(input$State)
  })
  
  req(input$State)
  if(input$State == "Arizona"){
  
output$result1 <- reactive(renderText({
    deductible_Arizona(input$allwd_amtW, input$sbtd_amtW,  input$copay_coin_amtW, input$ccoin_amtW)
  
    }))
  }

  if(input$State == "California"){
    
    output$result1 <- reactive(renderText({
      deductible_California(input$allwd_amtW, input$sbtd_amtW,  input$copay_coin_amtW, input$ccoin_amtW)
      
    }))
  }
  
  

  }
  

shinyApp(ui = ui, server = server)
