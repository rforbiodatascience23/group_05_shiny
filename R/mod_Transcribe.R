#' Transcribe UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_Transcribe_ui <- function(id){
  ns <- NS(id)
  tagList(sidebarLayout(
    sidebarPanel(
      textAreaInput(
        inputId = ns("peptide"),
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

#' Transcribe Server Functions
#' @importFrom ggplot2 theme
#' @import BioSeqR
#' @noRd
mod_Transcribe_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$abundance <- renderPlot({
      if(input$peptide == ""){
        NULL
      } else{
          BioSeqR::col_plot(input$peptide) +
          ggplot2::theme(legend.position = "none")
      }
    })

  })
}

## To be copied in the UI
# mod_Transcribe_ui("Transcribe_1")

## To be copied in the server
# mod_Transcribe_server("Transcribe_1")
