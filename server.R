airquality <- na.omit(airquality[,c(-5,-6)])


shinyServer(function(input, output, session) {
  
  selectedData <- reactive({
    airquality[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    par(mar = c(5, 4, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 2)
    points(clusters()$centers, pch = 3, cex = 6, lwd = 2, color = 300)
  })
})




