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
    draw_compare_bar(input$select.activities)
  )
  output$sleep_GPA <- renderPlot(
    draw_bar_graph_gpa_tired()
  )
}
