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
                                    selected = 3),
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
                             min = 2016, max = 2019, value = 2017)
               ),
               mainPanel(
                 plotOutput('us_map_7')
               )
             )
           )),
  tabPanel("Brutal Reality",
           titlePanel("The FACT that we are having less sleep hours can..."),
           p("The Brutal Reality tab shows people the certain fact that sleep deprivation is actually leading to a bad performance in life. It will be discussed in multiple ways, such as fatigue driving, test performances, and reaction times (RTs)."),
           
             sidebarPanel(

             ),
             mainPanel(
               plotOutput('')
             )
           )
  ),
  navbarMenu("Causes",
             tabPanel("Multiple Factors",
                      titlePanel("Why are we staying up so late?"),
                      p("In the future, we would visualized the differences between the hours spent in each potentially influential factors and the hours of sleep. ")
                      ),
             tabPanel("Life Tracking Sample",
                      titlePanel("Let's see what people in U.S. do during the day"),
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("select.activities", label = h3("Select an activity to compare with sleep's time:"), 
                                      choices = list("Cook" = 'life_tracking_df$cook', "Eat" = 'life_tracking_df$eat',
                                                     "Math" = 'life_tracking_df$math', "Music" = 'life_tracking_df$music',
                                                     "Pause" = 'life_tracking_df$pause', "Prep" = 'life_tracking_df$prep',
                                                     "Uni" = 'life_tracking_df$uni', "Meditatior" = 'life_tracking_df$meditatior',
                                                     "Special" = 'life_tracking_df$special', "Work" = 'life_tracking_df$work'), 
                                      selected = 10),
                          
                          hr(),
                        ),
                        mainPanel(
                          plotOutput('compared.bar')
                        )
                      )
                      )
             ),
  tabPanel("Impact",
           titlePanel("Risks taken for shortened sleep"),
           sidebarLayout(
             sidebarPanel(
               p("SOMETHING")
             ), 
             mainPanel(
               plotOutput('sleep_GPA')
             )
           )
  ), 
  tabPanel("Conclusion",
           tags$div(
             h2("Conclusion"), 
             p("The strength of our project is that our resources for datasets are from authentic organizations, including American Academy of Sleep Medicine (AASM), National Alliance on Mental Illness (NAMI), and the Centers for Disease Control and Prevention (CDC). By using these credible sources, our group ensures that the information presented in our project is reliable. On the other hand, one of the weaknesses of our project is the narrow age range we covered. We only targeted people aged from 18 to 39, which makes up about 26.3 percent of the U.S population. he project could be more applicable to more users. The main lesson our team learned from this project is, the sleeping trend in the U.S in recent years is getting worse. We found out that the lack of sleep could affect not only students' academic performance but also human health. In the future, people could improve the project by extending the age group and provide suggestions to improve people’s sleeping time and sleeping quality. Our team would also like to look deeper into the sleeping trend in different countries other than the U.S to make a comparison, as well as how foreign governments approach sleeping issues.")
           )
           ),
  navbarMenu("About",
             tabPanel("About Tech",
                      #titlePanel("Give credit to all the amazing sources!")
                      tags$div(
                        h2("Give credit to all the amazing sources!"), 
                        p("[1] Cunningham, J. (2019). College students aren’t getting nearly enough sleep. Retrieved from http://sleepeducation.org/news/2019/07/18/college-students-are-not-getting-nearly-enough-sleep"),
                        p("[2] Feraco, F. (2018). Sleep Deprivation. Retrieved from https://www.kaggle.com/feraco/sleep-deprivation#demdata_160225_pseudonymized.csv"),
                        p("[3] Fusion 360. (2014). Sleepless Nights. Retrieved from https://visual.ly/community/infographic/health/sleepless-nights"),
                        p("[4] Healthguru. (2012). Need More Sleep? The Facts On Sleeping Disorders. Retrieved from https://visual.ly/community/infographic/health/need-more-sleep-facts-sleeping-disorders"), 
                        p("[5] Lomuscio, M. (2019). Sleep Study. Retrieved from https://www.kaggle.com/mlomuscio/sleepstudypilot"),
                        p("[6] Mental Health Guide for College Students. (2019). Retrieved from https://collegestats.org/resources/mental-health-guide/"),
                        p("[7] Youngstedt, Shawn D et al. “Has adult sleep duration declined over the last 50+ years?.” Sleep medicine reviews vol. 28 (2016): 69-85. doi:10.1016/j.smrv.2015.08.004"),
                        p("[8] “500 Cities: Local Data for Better Health, 2018 Release.” Centers for Disease Control and Prevention, Centers for Disease Control and Prevention, https://chronicdata.cdc.gov/500-Cities/500-Cities-Local-Data-for-Better-Health-2018-relea/6vp6-wxuq"),
                        p("[9]Monideepa B. Becerra, Brittny S. Bol, Rochelle Granados & Christina Hassija (2018) Sleepless in school: The role of social determinants of sleep health among college students, Journal of American College Health, DOI: 10.1080/07448481.2018.1538148"),
                        p("[10] Life tracking project dataset. Retrieved from: https://www.kaggle.com/maxschmidt94/life-tracking-project-dataset#life_total_data.csv"),
                        h4("And a special thanks to Andrey Butenko, AKA our wonderful TA who helped us a lot!! :)")
                      )
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
                        p("Vivian Law is a junior student at University of Washington. She is in the Early Childhood Family Studies major. She enjoys photography and trying different foods. She has a passion for children and for technology. She values her Taiwanese and Cantonese culture. ")
                      )
              )
  )
)
