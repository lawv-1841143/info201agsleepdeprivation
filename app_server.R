library(shiny)

server <- function(input, output) {
  output$us_map_7 <- renderPlot(
    plot_usmap(data = new_df, regions = "state",
               values = "percent", color = "white") +
      scale_fill_continuous(low = "lightgrey", high = "black", 
                            name = "Sleep <7 hours(%)",
                            label = scales::comma) +
      theme(legend.position = "right") +
      ggtitle("Among all age group in U.S., 
Percentage of population getting less than 7 hours sleep")
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
}
