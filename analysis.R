library(dplyr)
library(stringr)
library(ggplot2)
library(plotly)
library(usmap)

# Read in dataset
sleep_data <- read.csv("data/sleep_data.csv", stringsAsFactors = FALSE)
polysomnography_studies_df <- read.csv('data/polysomnography_studies.csv',
                                       stringsAsFactors = F)
actigraphic_studies_df <- read.csv('data/actigraphic_studies.csv',
                                   stringsAsFactors = F)
life_tracking_df <- read.csv('data/LifeTrackingProjectDataset.csv',
                             stringsAsFactors = F)
sleep_causes_df <- read.csv("data/SleepStudyData.csv", stringsAsFactors = F)
info_sleep_df <- read.csv("data/demdata_160225_pseudonymized.csv",
                          stringsAsFactors = F)
# this .csv file is too large to be uploaded on to Github
# will ask Andrey about this
# US_df <- read.csv("data/500_Cities__Local_Data_for_Better_Health__2018_release.csv",
#                        stringsAsFactors = F)
# colnames(US_df)[1] <- "Year"
# this is the version after data wrangling for that huge .csv file
us_sleep_deprived <- read.csv("data/us_sleep_deprived.csv", stringsAsFactors = F)
# read in dataset with US state and the lat and long
statelatlong <- read.csv("data/statelatlong.csv", stringsAsFactors = F)

# reform the dataframe by grouping the sleep time by years
polysomnography_grouped_df <- group_by(polysomnography_studies_df, year) %>%
  summarize(sleep_time = mean(sleep_time)) %>%
  mutate(type = "Polysomnography Study")
actigraphic_grouped_df <- group_by(actigraphic_studies_df, year) %>%
  summarize(sleep_time = mean(sleep_time)) %>%
  mutate(type = "Actigraphic Study")
grouped_df <- bind_rows(polysomnography_grouped_df, actigraphic_grouped_df) %>%
  arrange(year)


# create a point plot and a best fit line with color difference to emphasize
# the data from two different study
ggplot(data = grouped_df) +
  geom_point(mapping = aes(x = year, y = sleep_time, color = type)) +
  geom_smooth(mapping = aes(x = year, y = sleep_time)) +
  ggtitle("US adults sleeping times for the recent decades") +
  scale_x_continuous(name = "Year") +
  scale_y_continuous(name = "Sleep Time (minute)") +
  labs(color = "Studies' Methods: ")

# data wrangling into data columns that needed in the map
# us_sleep_deprived <- US_df %>%
#   filter(MeasureId == "SLEEP") %>%
#   select(Year, StateAbbr, CityName, Data_Value, PopulationCount, GeoLocation, Short_Question_Text)
# write.csv(us_sleep_deprived, file = "us_sleep_deprived.csv")

# data wrangling with dataset,
new_df <- group_by(us_sleep_deprived, StateAbbr) %>%
  filter(StateAbbr != "US") %>%
  summarize(ave_percent = sum(Data_Value, na.rm = T) / n(),
            population = sum(PopulationCount)) %>%
  mutate(statelatlong$Latitude, statelatlong$Longitude)
colnames(new_df) <- c("state", "percent", "population", "lat", "long")

# plot the US map with data info
# version 1.0 without hover interaction ---- succeed
plot_usmap(data = new_df, values = "percent", color = "white", labels = T,
           label_color = "white") +
  scale_fill_continuous(low = "lightgrey", high = "black", 
                        name = "Sleep <7 hours(%)",
                        label = scales::comma) +
  theme(legend.position = "right")
# version 1.1 with hover interaction --- failed
ggplotly(plot_usmap(data = new_df, values = "percent", color = "white", labels = T, 
                         label_color = "white") +
                scale_fill_continuous(low = "lightgrey", high = "black", 
                                      name = "Sleep <7 hours(%)",
                                      label = scales::comma) +
                theme(legend.position = "right"),
              tooltip = c("value"))

# bar graph of GPA and feeling-tired relationship
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

# a function for bar graph of given sleep time and input time
#compare_bar <- function(other) {

#}
