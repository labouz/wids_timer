library(shiny)
library(shinyWidgets)
library(lubridate)

ui <- fluidPage(

  setBackgroundImage(
    src = "bkgnd2.png"
  ),
  tags$head(
    tags$style(HTML("@import url('https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&display=swap');")),
    tags$style("#countdown{font-family: 'Amatic SC', cursive;
                           color: green;
                           font-size: 90px;}"
    )
  ),
  fluidRow(
    column(6),
    column(6,div(style = "height:400px;background-color:#ffffff00;"))
  ),
  fluidRow(
    column(6),
    column(4, align="center", offset = 1,
           fluidRow(),
           br(),
           fluidRow(

             verbatimTextOutput("countdown")

           )
    )
    #column(2)
  )
)


server <- function(input, output, session) {
  # Define server logic to show current time, update every second ----
  output$countdown <- renderText({
    invalidateLater(1000, session)
    begin <- ymd_hms(now(tzone = "US/Eastern"), tz = "US/Eastern")
    end <- mdy_hms("April 23, 2021 13:00:00", tz = "US/Eastern")

    paste("Will begin in: ", as.period(interval(begin, end)), sep = "\n")
   # HTML(paste("Will begin in: ", as.period(interval(begin, end)), sep="<br/>"))
  })

}

shinyApp(ui, server)
