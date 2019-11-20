library(dplyr)
# analysis code for dataset and visualization

# create a dataframs for life tracking time
life_tracking_df <- read.csv('data/LifeTrackingProjectDataset.csv',
                             stringsAsFactors = F)
# create a timeline(?) for people's everyday life and see the sleeping time
# trend among people in the U.S.

# create a dataframe for multiple causes for short sleep time
sleep_causes_df <- read.csv("data/SleepStudyData.csv", stringsAsFactors = F)
# we can create a pie chart here to show th eproportion of causes impacting
# how people sleep in daily life

# create a datafram about people's physical condition with short sleeps
info_sleep_df <- read.csv("data/demdata_160225_pseudonymized.csv", 
                          stringsAsFactors = F)
# category: age group, sex. 
# can see symptoms of sleep deprivation (anxiety, depression, snoring, ), and nap conditions. 


orginal_df <- read.csv("data/500_Cities__Local_Data_for_Better_Health__2018_release.csv", 
                          stringsAsFactors = F)
us_sleep_deprived <- orginal_df %>% 
  filter(MeasureId == "SLEEP") %>% 
  select(Year, StateAbbr, CityName, Data_Value, PopulationCount, GeoLocation, Short_Question_Text)
write.csv(us_sleep_deprived, file = "us_sleep_deprived.csv")
