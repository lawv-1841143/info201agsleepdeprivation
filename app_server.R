library(shiny)
library(plotly)

source('analysis.R')

server <- function(input, output) {
  output$us_map_7 <- renderPlot(
    draw_us_sleep_map()
  )
  output$us_timeline <- renderPlot(
    draw_sleep_trend_plot(input$StudiesMethods)
  )
  output$pie_chart <- renderPlotly(
    draw_pie()
  )
  output$compared.bar <- renderPlotly(
    draw_compare_bar(input$select.activities)
  )
  output$sleep_GPA <- renderPlotly({
    return(draw_bar_graph_gpa_tired())
  })
}
