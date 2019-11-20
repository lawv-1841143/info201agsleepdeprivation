install.packages()
library(dplyr)
library(stringr)
library(ggplot2)
library(plotly)

sleep_data <- read.csv("data/sleep_data.csv", stringsAsFactors = FALSE)
polysomnography_studies_df <- read.csv('data/polysomnography_studies.csv',
                             stringsAsFactors = F)
actigraphic_studies_df <- read.csv('data/actigraphic_studies.csv',
                                       stringsAsFactors = F)
colnames(polysomnography_studies_df) <- c("year", "age_range", "sleep_time")

polysomnography_grouped_df <- group_by(polysomnography_studies_df, year) %>% 
  summarize(sleep_time = mean(sleep_time))
actigraphic_grouped_df <- group_by(polysomnography_studies_df, year) %>% 
  summarize(sleep_time = mean(sleep_time))

ggplot(data = polysomnography_grouped_df) + 
  geom_point(mapping = aes(x = year, y = sleep_time)) +
  geom_smooth(mapping = aes(x = year, y = sleep_time))

ggplot(data = polysomnography_grouped_df) + 
  geom_point(mapping = aes(x = year, y = sleep_time)) +
  geom_smooth(mapping = aes(x = year, y = sleep_time))

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

