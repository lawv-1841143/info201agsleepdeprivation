# install.packages("shinythemes")

library(shiny)
library(shinythemes)

ui <- navbarPage(
  theme = shinytheme("superhero"),
  "Sleep Deprivation",
  tabPanel("Background"),
  tabPanel("Trend", 
           titlePanel("The current sleeping time trend in U.S. population")),
  tabPanel("Brutal Reality", 
           titlePanel("The FACT that we are having less sleep hours...")), 
  navbarMenu("Causes", 
             tabPanel("Multiple Factors", 
                      titlePanel("Why are we staying up so late?")), 
             tabPanel("Life Tracking Sample", 
                      titlePanel("Let's see what people in U.S. do during the day"))), 
  tabPanel("Impact", 
           titlePanel("Risks taken for shortened sleep")), 
  tabPanel("Conclusion", 
           titlePanel("Conclusion")), 
  navbarMenu("About", 
             tabPanel("About Tech", 
                      titlePanel("Give credit to all the amazing sources!")), 
             tabPanel("About Us", 
                      titlePanel("More Information on project members!")))
)
