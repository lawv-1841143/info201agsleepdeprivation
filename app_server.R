library(shiny)
source('analysis.R')

server <- function(input, output) {
  output$us_map_7 <- renderPlot(
    ggplotly(plot_usmap(data = new_df, values = "percent", color = "white", labels = T, 
                        label_color = "white") +
               scale_fill_continuous(low = "lightgrey", high = "black", 
                                     name = "Sleep <7 hours(%)",
                                     label = scales::comma) +
               theme(legend.position = "right"),
             tooltip = c("value"))
  )
  output$us_timeline <- renderPlot(
    ggplot(data = grouped_df) + 
      geom_point(mapping = aes(x = year, y = sleep_time, color = type)) +
      geom_smooth(mapping = aes(x = year, y = sleep_time)) +
      ggtitle("US adults sleeping times for the recent decades") +
      scale_x_continuous(name = "Year") +
      scale_y_continuous(name = "Sleep Time (minute)") +
      labs(color = "Studies' Methods: ")
  )
  output$value <- renderPrint({input$StudiesMethods})
  output$value <- renderPrint({input$YearRange})
}
