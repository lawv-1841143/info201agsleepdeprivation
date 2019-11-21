library(shiny)

source('analysis.R')

server <- function(input, output) {
  output$us_map_7 <- renderPlot(
    draw_us_sleep_map()
  )
  output$us_timeline <- renderPlot(
    draw_sleep_trend_plot(input$StudiesMethods)
  )
  #output$value <- renderPrint({input$YearRange})
  output$compared.bar <- renderPlot(
    #activity <- input$select.activities,
    draw_compare_bar(input$select.activities)
  )
  output$sleep_GPA <- renderPlot(
    plot_ly(
      x = c("Yes", "No"),
      y = c(3.04, 3.24),
      type = "bar"
    ) %>%
      layout(
        title = "Feeling tired, fatigued, or daytime sleepiness",
        xaxis = list(title = "Answer"),
        yaxis = list(title = "GPA")
      )
  )
}
