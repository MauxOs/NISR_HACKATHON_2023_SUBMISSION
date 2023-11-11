# Install and load necessary packages
if (!require("shiny")) install.packages("shiny")
if (!require("plotly")) install.packages("plotly")
library(shiny)
library(plotly)
library(readxl)

# importing data set to be used in my shiny app

CPI  <- read_excel("C:/Users/user/Desktop/CPI Data.xlsx", 
                                       sheet = "All Rwanda")
urban_CPI <- read_excel("C:/Users/user/Desktop/CPI_time_series_November_2022.xls", 
                                            sheet = "Urban")

rural_CPI <- read_excel("C:/Users/user/Desktop/CPI_time_series_November_2022.xls", 
                                            sheet = "Rural")


others_CPI <- read_excel("C:/Users/user/Desktop/CPI_time_series_November_2022.xls", 
                                            sheet = "Other")


# Define UI
ui <- fluidPage(
  titlePanel("Insightful CPI Chronicles: Navigating Economic Trends and Sectoral 
             Contributions in Rural and Urban Economies."),
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Select a variable:",
                  choices = c("GENERAL INDEX (CPI)", "Food and non-alcoholic beverages", "Alcoholic beverages and tobacco",
                              "Clothing and footwear","Housing, water, electricity, gas and other fuels","Furnishing, household equipment and routine household maintenance",
                              "Health","Transport","Communication","Recreation and culture","Education","Restaurants and hotels",
                              "Miscellaneous goods and services"),
                  selected = "GENERAL INDEX (CPI)"),
      verbatimTextOutput("comments"),
      
    ),
    mainPanel(
      plotlyOutput("lineChart"),
      br(),
      br(),
      textOutput("outputText1"),
      br(),
      br(),
      br(),
      plotlyOutput("Plot0"),
      br(),
      br(),
      plotlyOutput("Plot1"),
      br(),
      br(),
      textOutput("outputText2"),
      br(),
      br(),
      br(),
      plotlyOutput("Plot2"),
      br(),
      br(),
      textOutput("outputText3"),
      br(),
      br(),
      br(),
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  output$lineChart <- renderPlotly({
    # Create line chart based on selected variable
    
    
    Trend <- plot_ly(CPI, x = ~Date, y = ~get(input$variable), type = 'scatter', mode = 'lines', fill='tozeroy', 
                  color = I("blue"),
                   name = input$variable) %>%
      layout(title =paste("Trend of",input$variable,paste("in Rwanda")),
             xaxis = list(title = "Time"),
            yaxis = list(title = paste("Values of",input$variable)))
    
  })
  output$outputText1 <- renderText({
    paste("") %>% 
    paste("
    
    The following pie charts illustrate the overall composition of the Consumer Price Index (CPI) in rural area, urban area and other indices. 
    Delve into yearly variations and witness how certain sectors influence CPI dynamics differently each year. 
    Hover over each sector to interactively explore its contribution, providing a nuanced understanding of the economic landscape.
          
          ")
  })
  
  output$Plot0 <- renderPlotly({
    
    Urban_plot <- plot_ly(urban_CPI, labels = urban_CPI$ITEM, values = urban_CPI$Weights, type = "pie", textinfo = "percent", 
                          insidetextfont = list(color = "#FFFFFF"), 
                          
                          marker = list(line = list(color = "#FFFFFF", width = 6))) %>%
      layout(title = "CPI IN URBAN AREA")
    
    
    # Return the plotly object
    Urban_plot
    
  })
  
  
  output$Plot1 <- renderPlotly({
    
    rural_plot <- plot_ly(rural_CPI, labels = rural_CPI$ITEM, values = rural_CPI$Weights, type = "pie", textinfo = "percent", 
                          insidetextfont = list(color = "#FFFFFF"), 
                           
                          marker = list(line = list(color = "#FFFFFF", width = 6))) %>%
      
      layout(title = 
               "CPI IN RURAL AREA.")
    
    
    # Return the plotly object
    rural_plot
    
  }) 
  
  output$outputText2 <- renderText({
    paste("Brief Overview:") %>% 
      paste("The urban CPI landscape where “Food and non-alcoholic beverages”, “Housing, water, electricity, gas, and other fuels” and “Transport” 
      play pivotal roles in shaping economic trends. Whereas, In rural areas, the CPI is shaped by the significant contributions of “Food and non-alcoholic beverages”, “Housing, water, electricity, gas, and other fuels” and “Alcoholic beverage and tobacco”") %>%
                  paste(".........................................................................................................................................................................................................................................................") %>% 
      paste("Notice the noteworthy impact of “Food and non-alcoholic beverages” and “Housing, water, electricity, gas, and other fuels”
             on the CPI in both rural and urban settings.”")
  })
  
  
  output$Plot2 <- renderPlotly({

    other_plot <- plot_ly(others_CPI, labels = others_CPI$ITEM, values = others_CPI$Weights, type = "pie", textinfo = "percent", 
                          insidetextfont = list(color = "#FFFFFF"), 
                          
                          marker = list(line = list(color = "#FFFFFF", width = 6))) %>%
      layout(title = "CPI IN OTHER INDICES")
    
    
    # Return the plotly object
    other_plot
    
  }) 
  
  output$outputText3 <- renderText({
    paste("Brief Overview:") %>% 
      paste("Other indices  Section, the CPI is shaped by the significant contributions of “General index excluding fresh products and energy” and “Local goods index”.") %>% 
      paste("___________________________________________________________________________________________________________________________") %>% 
          paste("These pie charts offer insights into how each sector’s contribution influences inflation, painting a comprehensive picture of economic dynamics.") %>% 
      paste("___________________________________________________________________________________________________________________________") %>% 
      paste("Thank you!")
      
      
  })
  
}

# Run the application
shinyApp(ui = ui, server = server)
