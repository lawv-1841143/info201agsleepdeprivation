library(shiny)
library(shinythemes)
source('analysis.R')

ui <- navbarPage(
  theme = shinytheme("superhero"),
  "Sleep Deprivation",
  tabPanel("Background", 
           tags$div(
             p("This project digs deeper into people's daily life and looks especially into the area of sleeping and its related fields. We all know that the most important requirement for daily performance including concentration, calculation and reaction is to have enough rest during the night. The U.S. population, however, is facing a decline in recent decades in sleeping time and quality. In this project, we'll discuss the causes leading to this trend, the hidden impacts and some suggestions to people on how to get a good rest. "),
             h2("Page Description"),
             p("The Trend tab will show you a current trend in recent decades about people's sleeping time in general."), 
             p("The Brutal Reality tab shows people the certain fact that sleep deprivation is actually leading to a bad performance in life. It will be discussed in multiple ways, such as fatigue driving, test performances, and reaction times (RTs)."),
             p("The Causes tab is about multiple factors that might contribute to sleep deprivation. We visualized the differences between the hours spent in each potentially influential factors and the hours of sleep. The Life Tracking sub-tab displays an average data of what people do in their daily life. And the user can type in their time use for daily life to fit into the graph and see their difference with U.S. population averages."), 
             p("The Impact tab introduces possible diseases that people might have due to sleep deprivation. A hug contrast can be seen in this tab, and the users can see the reduces risks if they sleep more. An interaction just for fun: test to see how many years you have left if you keep having sleep deprivation.")
            )
           ),
  tabPanel("Trend", 
           tags$div(
             h2("The current sleeping time trend in U.S. population"), 
             sidebarLayout(
               sidebarPanel(
                 radioButtons("StudiesMethods",
                                    label = h3("Studies' Methods"), 
                                    choices = list("Actigraphic Study" = 1,
                                                   "Polysomnography Study" = 2,
                                                   "Both Studies" = 3),
                                    selected = 1),
                 hr(),
               ), 
               mainPanel(
                 plotOutput('us_timeline')
               )
             ), 
             h2("Geographic map of US adults sleeping <7 hours"), 
             sidebarLayout(
               sidebarPanel(
                 sliderInput("YearRange",
                             label = h3("Range of interest:"),
                             min = 1991, max = 2019, value = 2000)
               ), 
               mainPanel(
                 plotOutput('us_map_7')
               )
             )
           )),
  tabPanel("Brutal Reality", 
           titlePanel("The FACT that we are having less sleep hours can..."), 
           sidebarLayout(
             sidebarPanel(
               
             ), 
             mainPanel(
               plotOutput('')
             )
           )
  ), 
  navbarMenu("Causes", 
             tabPanel("Multiple Factors", 
                      titlePanel("Why are we staying up so late?")), 
             tabPanel("Life Tracking Sample", 
                      titlePanel("Let's see what people in U.S. do during the day"))
             ), 
  tabPanel("Impact", 
           titlePanel("Risks taken for shortened sleep")), 
  tabPanel("Conclusion", 
           titlePanel("Conclusion")
           ), 
  navbarMenu("About", 
             tabPanel("About Tech", 
                      titlePanel("Give credit to all the amazing sources!")
              ), 
             tabPanel("About Us", 
                      # titlePanel("More Information on project members!"), 
                      tags$div(
                        h2("More Information on project members!"), 
                        h3("Phuong Vu"), 
                        p("Phuong Vu is an international student at the University of Washington in his sophomore year, who wants to study Informatics. He enjoys writing code that would solve real-life tasks. During his free time, he loves traveling to new places to take artistic photos and create videos."), 
                        h3("Yu-Wen Chen"), 
                        p("Yu-Wen Chen is currently a Freshman at the University of Washington from Taoyuan, Taiwan. She enjoys creative problem solving and figuring things out with her team. Outside of  the classroom, she loves spending time doing creative writing and reading Asian literature. Most importantly, she thinks her dog May-May is the cutest dog in the universe."), 
                        h3('Hanzhi Cao'),
                        p('Hanzhi Cao is an international student in UW studying Psychology in her senior year. On one hand she loves psychology and would love to know more about the mysterious human kind. On the other hand, she is also into data field that people are generating data every day every second. She believes that efficiency is EVERYTHING, so her ultimate goal of life is to find a better way to improve human life experience.'), 
                        h3("Vivian Law"), 
                        p("NA")
                      )
              )
  )
)
