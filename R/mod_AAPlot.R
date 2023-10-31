#' AAPlot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_AAPlot_ui <- function(id){
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        textAreaInput(
          ns("peptide"),
          label = "Peptide sequence",
          width = 300,
          height = 100,
          placeholder = "Insert peptide sequence"
        )
      ),
      mainPanel(
        plotOutput(
          outputId = ns("abundance")
        )
      )
    )
  )
}

#' AAPlot Server Functions
#'
#'@importFrom ggplot2 theme
#'@importFrom BioSeqR col_plot
#' @noRd
mod_AAPlot_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$abundance <- renderPlot({
      if(input$peptide != ""){
        corr_input <- gsub(" ", "", input$peptide)
        corr_input |>
          col_plot()
      }
    })
  })
}

## To be copied in the UI
# mod_AAPlot_ui("AAPlot_1")

## To be copied in the server
# mod_AAPlot_server("AAPlot_1")
