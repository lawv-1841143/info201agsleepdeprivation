library(dplyr)
library(stringr)
library(ggplot2)
library(plotly)

sleep_data <- read.csv("sleep_data.csv", stringsAsFactors = FALSE)




sleep_data %>%
plot_ly(
  x = ~Daytime_Sleepiness,
  y = ~GPA,
  type = "bar"
) %>% 
  layout(
    title = "Feeling tired, fatigued, or daytime sleepiness",
    xaxis = list(title = "Answer"),
    yaxis = list(title = "GPA")
  )

