library(shiny)

base_path <- Sys.getenv("SHINY_BASE_PATH", "/")

ui <- fluidPage(
  titlePanel("SimpleVM Services - Shiny Demo"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("n", "No. of Values:", min = 50, max = 1000, value = 300),
      sliderInput("bins", "No. of Bars:", min = 5, max = 50, value = 20),
      selectInput("color", "Color:", 
                  choices = c("steelblue", "tomato", "seagreen", "goldenrod"))
    ),
    
    mainPanel(
      h4(textOutput("stats")),
      plotOutput("histPlot"),
      p(em("This is a demonstration of what you can do with the new SimpleVM Services Feature! Check out our Wiki for further information and a guide on how to do the same!"))
    )
  )
)

server <- function(input, output) {
  values <- reactive({
    rnorm(input$n)
  })
  
  output$stats <- renderText({
    x <- values()
    paste(
      "Mean:", round(mean(x), 2),
      "| Standard Deviation:", round(sd(x), 2)
    )
  })
  
  output$histPlot <- renderPlot({
    hist(
      values(),
      breaks = input$bins,
      col = input$color,
      border = "white",
      main = "Interactive Histogram",
      xlab = "Values"
    )
  })
}

#subpath routing
ui_pattern <- if (base_path == "/") {
  "/"
} else {
  paste0(base_path, "/?")
}

shinyApp(
  ui = ui,
  server = server,
  uiPattern = ui_pattern
)
