library(shiny)

page_one <- tabPanel(
  "Home",
  titlePanel("Home")
)

page_two <- tabPanel(
  "Current Situation",
  titlePanel("Current Situation")
)

page_three <- tabPanel(
  "Cause",
  titlePanel("Cause")
)

page_four <- tabPanel(
  "Impact",
  titlePanel("Impact")
)

page_five <- tabPanel(
  "Suggestion/ Advice",
  titlePanel("Suggestion/ Advice")
)

page_six <- tabPanel(
  "About",
  titlePanel("About")
)

ui <- navbarPage(
  "Sleep Deprivation",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  page_six
)