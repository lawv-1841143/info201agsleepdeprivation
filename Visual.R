library(dplyr)
library(stringr)
library(ggplot2)
library(plotly)

sleep_data <- read.csv("sleep_data.csv", stringsAsFactors = FALSE)





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

