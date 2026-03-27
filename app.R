#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
library(shinylive)
library(httpuv)
library(shiny)
library(ggplot2)
library(DT)

ui <- fluidPage(
  plotOutput(outputId = "plot",
             brush = "plot_brush"),
  DTOutput(outputId = "table")
)

server <- function(input, output) {
  output$plot <- renderPlot(
    ggplot(mtcars) +
      geom_point(aes(x = mpg,
                     y = disp))
  )
  output$table <- renderDT({
    brushedPoints(df = mtcars,
                  brush = input$plot_brush)
  })
}

shinyApp(ui = ui, server = server)
