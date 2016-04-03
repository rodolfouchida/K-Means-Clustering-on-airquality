library(shiny)

shinyUI(pageWithSidebar(
  headerPanel('Air Quality k-Means Clustering'),
  sidebarPanel(
    h4("This small shiny app calculates the K-means clustering for the airquality dataset in R"),
    selectInput('xcol', 'X axis', names(airquality[,c(-5,-6)])),
    selectInput('ycol', 'Y axis', names(airquality[,c(-5,-6)]),
                selected=names(airquality[,c(-5,-6)])[[2]]),
    sliderInput("clusters", label = h3("Number of Clusters"), min = 1, 
                max = 10, value = 1)
  ),
  mainPanel(
    plotOutput('plot1')
  )
))


