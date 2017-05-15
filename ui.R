library(shiny)

shinyUI(fluidPage(tabsetPanel(
    tabPanel(h2("How to Use"),h3("This Performance tool will Predict the Seconds for a car to complete a Quarter mile distance from a standstill and accelerate with the selected Weight & Horsepower."),
h3(""),
h3("Being Weight and Horsepower are highly associated with predicting the performance of a car, Sliders are available on the left of the tool to adjust these variables."),
h3(""),
p(strong(h3("*      The Weight slider represents the pounds (lbs) of the vehicle divided by 1000."))),
p(strong(h3("*      The Horsepower slider represents the Gross Engine Horsepower."))),
h3("Move the sliders left/right and look for the Blue Diamond on the graph or the Predicted seconds below the graph."),
h3("However, please be aware this tool is based off a small data set from Motor Trend and several other variables influence performance so this is only a starting point."),
h3(""),
tags$a(href="http://github.com/JHolling/DDP/tree/Project-3",h3("Click HERE To See Code!"))
            ),

    tabPanel(h2("Performance Tool"),
        titlePanel("Performance prediction: Weight & Horsepower"),
            sidebarLayout(
                sidebarPanel(
                    h3("________________"),
                    titlePanel("Predictors:"),
                    h4("Move Sliders to adjust Output"),
                    sliderInput("wt.in",label=h4("Vehicle Weight / 1000lbs"),
                        min=.1,max=7,value=3.21),
                    sliderInput("hp.in",label=h4("Gross Engine Horsepower"),
                        min=50,max=700,value=250),
                    h3("________________")
                            ),
        
        mainPanel(
            plotOutput("qsec.plot"),
            h3("Predicted Quarter Mile time (seconds):"),
            strong(h2(textOutput("points")))
                 )
                       )
          )
                         )
              )    
     )