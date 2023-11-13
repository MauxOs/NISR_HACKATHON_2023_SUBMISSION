# Install and load required packages

library(shiny)
library(shinydashboard)
library(plotly)
library(readxl)


# Import your dataset (replace file path with your actual file path)

CPI <- read_excel("E:/NISR Competition/CPI & GDP Data.xlsx", 
                  sheet = "All Rwanda")

GDP <- read_excel("E:/NISR Competition/CPI & GDP Data.xlsx", 
                  sheet = "Contribution")

GDP_growth_rate <- read_excel("E:/NISR Competition/CPI & GDP Data.xlsx", 
                  sheet = "Growth rate")


urban_CPI <- read_excel("E:/NISR Competition/CPI & GDP Data.xlsx", 
                        sheet = "Urban")

rural_CPI <- read_excel("E:/NISR Competition/CPI & GDP Data.xlsx", 
                        sheet = "Rural")


others_CPI <- read_excel("E:/NISR Competition/CPI & GDP Data.xlsx", 
                         sheet = "Other")

CPI_CHANGE_ANNUAL <- read_excel("E:/NISR Competition/CPI & GDP Data.xlsx", 
                                sheet = "Annual")

CPI_CHANGE_MONTHLY <- read_excel("E:/NISR Competition/CPI & GDP Data.xlsx", 
                                 sheet = "Monthly")



# Define UI
ui <- dashboardPage(
  dashboardHeader(title = "CPI and GDP Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("TREND", tabName = "dashboard", icon = icon("line-chart")),
      menuItem("CPI Weights", tabName = "pie_chart", icon = icon("chart-pie")),
      menuItem("CPI Variation", tabName = "CPI", icon = icon("area-chart")),
      menuItem("GDP", tabName = "GDP", icon = icon("bar-chart")),
      conditionalPanel(
        condition = "input.tabs === 'dashboard'",
        
        selectInput("variable", "Select a variable:",
                    choices = c("GENERAL INDEX (CPI)", "Food and non-alcoholic beverages", "Alcoholic beverages and tobacco",
                                "Clothing and footwear","Housing, water, electricity, gas and other fuels","Furnishing, household equipment and routine household maintenance",
                                "Health","Transport","Communication","Recreation and culture","Education","Restaurants and hotels",
                                "Miscellaneous goods and services"),
                    selected = "GENERAL INDEX (CPI)"),
        
      ),
      
      conditionalPanel(
        condition = "input.tabs === 'GDP'",
        selectInput("barvariable", "Select a variable:",
                    choices = c("GROSS DOMESTIC PRODUCT (GDP)","AGRICULTURE, FORESTRY & FISHING","INDUSTRY","SERVICES","TAXES LESS SUBSIDIES ON PRODUCTS"),
                    selected = "GROSS DOMESTIC PRODUCT (GDP)"),
        )
        
      
    )
  ),
  dashboardBody(
    tabItems(
      
      tabItem(tabName = "dashboard",
              plotlyOutput("lineChart"),
              br(),
              box(  title = "Notes",
                    "This interactive line chart shows the trend of General index (CPI) and twelve 12 main categories. 
                It shows how CPI and 12 main categories evolved since 2009 up to 2022. Our interactive dashboard provides a visual journey through time-series data, allowing you to analyze 
                and understand the changing trends of each category. Dive into the details, uncover patterns, and make data-driven decisions with ease.",
                    br(),
                    br(),
                    "You may navigate to the percentage (%)  weight tab on left side of the dashboard to get insight on at which percentage each category contribute to General index (CPI).",
                    status = "success",
               
           )  
             
      ),
      tabItem(tabName = "CPI", 

               box(
                title = "CPI Variation in Urban and Rural, This is percentage change on the same period 12 months earlier.",
                br(),
                height = 50,
                width = 12,
                status = "success",
                plotlyOutput("lineChart1"),
                br(),
                br(),
            
                plotlyOutput("lineChart2"), 
                br(),br(),
                
                box(title = "Note", "Urban CPI will be the focus of this publication as it is the headline index for monetary
                    policy purposes.", status = "info"),
                
                box(title = "Urban General Index (CPI)",
                "Urban CPI increased by 21.7 percent on annual basis (November 2022 and November 2021)
                and increased by 0.8 percent on monthly basis (November 2022 to October 2022). The annual 
                average inflation rate between November 2022 and November 2021 was 12.3 percent.", status = "info"),
                
                box(title =  "Rural General Index (CPI)",
                    "Rural CPI increased by 42.9 percent on annual basis and increased by 1.5 percent on monthly basis.", status = "info"),
                
                box(title =  "Overall Rwanda General Index (CPI)",
                    "Rwanda CPI increased by 33.8 percent on annual basis and increased by 1.3 percent on monthly basis.", status = "info"),

              )),
  
      tabItem(tabName = "GDP",
              box(
                title = "Percentage Contribution of Each Industry to GDP",
                br(),
                width = 12,
                status = "success",
                height = 50,
                
              tabItem(tabName = "Box",
                      valueBox(
                        value =GDP$INDUSTRY ,  
                        subtitle = "Contribution of Industries",
                        icon = icon("bar-chart"),
                        color = "teal"
                      ),
                      
                      valueBox(
                        value =GDP$`AGRICULTURE, FORESTRY & FISHING` ,  
                        subtitle = "Contribution of Agriculture, Forestry & Fishing",
                        icon = icon("area-chart"),
                        color = "green"
                      ),
                      valueBox(
                        value =GDP$SERVICES ,  
                        subtitle = "Contribution of Services",
                        icon = icon("university"),
                        color = "blue"
                      ),
                      valueBox(
                        value =GDP$`TAXES LESS SUBSIDIES ON PRODUCTS` ,  
                        subtitle = "Contribution of Taxes Less Subsidies on Product",
                        icon = icon("coins"),
                        color = "orange",
                        
                      ),
                      br(),
                      tabItem(tabName = "bar_chart",
                              box(
                                title = "Variation of Percentage GDP growth From 2017- 2022.",
                                br(),
                                width = 9,
                                status = "success",
                                height = 50,
                                plotlyOutput("barChart")
                              )),
                ),
      )),
      
      tabItem(tabName = "pie_chart",
              box(
                title = "Interactive pie charts presenting percentage weights of main categories to CPI IN Rural and Urban areas & Other Selected Urban indices.",
                br(),
                br(),
                
                plotlyOutput("Plot0"),
                width = 15,
                br(),
                
                plotlyOutput("Plot1"),
                br(),
                br(),
                
                plotlyOutput("Plot2"),
                br(),
                
                box(
                  title = "Notes",
            "Delve into yearly variations and witness how certain sectors influence CPI dynamics differently each year.",br(),br(),
            "Hover over each sector to interactively explore its contribution, providing a nuanced understanding of the economic landscape.", br(),br(),
            "These pie charts offer insights into how each sector’s contribution influences inflation, painting a comprehensive picture of economic dynamics.",br(),br(),
                  
                  status = "primary"
                ),
            
                box(
                  title = "Brief Overview",
                  "Explore the urban CPI landscape, where “Food and non-alcoholic beverages”, 
            “Housing, water, electricity, gas, and other fuels”, and “Transport” play pivotal roles 
            in shaping economic trends.",br(), br(),"In rural areas, the CPI is shaped by the significant contributions of “Food and non-alcoholic beverages”, 
            “Vegetables”, and “Housing, water, electricity, gas, and other fuels”.",br(), br()," Notice the noteworthy impact of “Food and non-alcoholic beverages”, “Housing, water, electricity, gas, and other fuels”, 
            and “Vegetables” on the CPI in both rural and urban settings.",
                  status = "info"
                ),
                
                box(
                  title = "Brief Description",
                  "Other selected urban indices, the CPI is shaped by the significant contributions of “General index excluding fresh products and energy”, “Local goods index”, 
                  and “Food and non-alcoholic beverages”.",
                 
                  status = "info"
                ),
            
            box(
              title = "Note",
              "These pie charts offer insights into how each sector’s contribution influences inflation, painting a comprehensive picture of economic dynamics.",br(),
                  
              status = "primary"
            ),
            
            box("Thank you!",status = "success")
        )
      )
    )
  )
  )

# Define server logic
server <- function(input, output) {
  # Reactive plot
  
  output$lineChart <- renderPlotly({
    # Create line chart based on selected variable
    
    
    Trend <- plot_ly(CPI, x = ~Date, y = ~get(input$variable), type = 'scatter', mode = 'lines', fill='tozeroy', 
                     color = I("blue"),
                     name = input$variable) %>%
      layout(title =paste("Trend of",input$variable,paste("in Rwanda")),
             xaxis = list(title = "Time"),
             yaxis = list(title = paste("Values of",input$variable)))
    
  })
  
  
  
  output$Plot0 <- renderPlotly({
    
    Urban_plot <- plot_ly(urban_CPI, labels = urban_CPI$ITEM, values = urban_CPI$Weights, type = "pie", textinfo = "percent", 
                          insidetextfont = list(color = "white"), 
                          
                          marker = list(line = list(color = "white", width = 6))) %>%
      layout(title = "Percentage Weight of Each Category To CPI In Urban Area")
    
    
    Urban_plot
    
  })
  
  
  output$Plot1 <- renderPlotly({
    
    rural_plot <- plot_ly(rural_CPI, labels = rural_CPI$ITEM, values = rural_CPI$Weights, type = "pie", textinfo = "percent", 
                          insidetextfont = list(color = "white"), 
                          
                          marker = list(line = list(color = "white", width = 6))) %>%
      
      layout(title = "Percentage Weight of Each Category To CPI In Rural Area")
    
    
    rural_plot
    
  }) 
  
  
  output$Plot2 <- renderPlotly({
    
    other_plot <- plot_ly(others_CPI, labels = others_CPI$ITEM, values = others_CPI$Weights, type = "pie", textinfo = "percent", 
                          insidetextfont = list(color = "white"), 
                          
                          marker = list(line = list(color = "white", width = 6))) %>%
      layout(title = "Percentage Weight of Each Category To CPI In Other Selected Urban Indices")
    
    
    other_plot
    
  }) 
  
  
  output$barChart <- renderPlotly({
    # Create line chart based on selected variable
    
    
    fig <- plot_ly(GDP_growth_rate, x = ~Date, y = ~get(input$barvariable), type = 'bar', 
                     color = ("maroon"),
                     name = input$barvariable) %>%
      layout(title =paste("Growth rate of",input$barvariable,paste("in Rwanda")),
             xaxis = list(title = "Time"),
             yaxis = list(title = paste("% Contribution of ",input$barvariable)))
  })
  
  output$lineChart1 <- 
    renderPlotly({
      plot_ly(CPI_CHANGE_ANNUAL,x = ~CPI_CHANGE_ANNUAL$Date) %>%
        add_lines(y = ~CPI_CHANGE_ANNUAL$`Urban CPI Annual Change`, name = "Urban CPI Annual Change", line = list(color = "blue")) %>%
        add_lines( y = ~CPI_CHANGE_ANNUAL$`Rural CPI Annual Change`, name = "Rural CPI Annual Change", line = list(color = "red", dash = "dash")) %>%
        add_lines( y = ~CPI_CHANGE_ANNUAL$`Rwanda CPI Annual Change`, name = "Rwanda CPI Annual Change", line = list(color = "green")) %>% 
        layout(title = "Annual variation of CPI",
               xaxis = list(title = "Date"),
               yaxis = list(title = "CPI Value in %"))
      
    })
  
  
  output$lineChart2 <- 
    renderPlotly({
      plot_ly(CPI_CHANGE_MONTHLY,x = ~CPI_CHANGE_MONTHLY$Date) %>%
        add_lines(y = ~CPI_CHANGE_MONTHLY$`Urban CPI Monthly Change`, name = "Urban CPI Monthly Change", line = list(color = "blue")) %>%
        add_lines( y = ~CPI_CHANGE_MONTHLY$`Rural CPI Monthly Change`, name = "Rural CPI Monthly Change", line = list(color = "red", dash = "dash")) %>%
        add_lines( y = ~CPI_CHANGE_MONTHLY$`Rwanda CPI Monthly Change`, name = "Rwanda CPI Monthly Change", line = list(color = "green")) %>% 
        layout(title = "Monthly variation of CPI",
               xaxis = list(title = "Date"),
               yaxis = list(title = "CPI Value in %"))
      
    })
  }

# Run the Shiny App
shinyApp(ui, server)
