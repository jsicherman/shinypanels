library(shinypanels)

ui <- fluidPage(
  withTags(head(useShinyPanels())),

  div(class = 'layout-container',
      div(class = 'layout-panels',
          div(class = 'app-container',

              panel(
                title = "Panel 1",
                width = 300,
                color = "magenta",
                div(
                  h3("Here is some info"),
                  hr(),
                  verbatimTextOutput("debug"),
                  hr(),
                  p("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                )
              ),
              panel(
                title = "Panel 3",
                width = 350,
                collapsed = TRUE,
                div(
                  plotOutput("plot", width = 330)
                )
              ),
              panel(
                title = "Panel 4",
                can_collapse = FALSE,
                div(
                ),
                footer = HTML("Footer")
              )

              )
          )
      )
)



server <-  function(input, output, session) {

  output$debug <- renderPrint({
    cat(paste(c("La", "casa", "en", "el", "árbol"), collapse = "\n"))
  })

  output$plot <- renderPlot(
    plot(cars)
  )

}

shinyApp(ui, server)

