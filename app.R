# Plot a wordcloud to summarise the tags that a stack-overflow user tends to
# answer/ask about

library(shiny)
library(wordcloud)
library(stackr)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Stack Overflow Tags"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(
        textInput("user_id", "Stack overflow User ID:", "1845650")
      ),

      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("word_cloud")
      )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$word_cloud <- renderPlot({
      with(
        stackr::stack_users(input[["user_id"]], "top-tags"),
        wordcloud::wordcloud(
          tag_name,
          answer_score,
          min.freq = 0,
          colors = RColorBrewer::brewer.pal(6, "Purples")[-1],
          scale = c(10, 0.5)
        )
      )
    })
}

# Run the application
shinyApp(ui = ui, server = server)
