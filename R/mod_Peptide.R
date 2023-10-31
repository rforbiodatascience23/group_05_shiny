#' Peptide UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_Peptide_ui <- function(id){
  ns <- NS(id)
  tagList(fluidRow(
    column(8, shiny::uiOutput(ns("DNA"))),
    column(4, shiny::numericInput(
      inputId = ns("dna_length"),
      value = 6000,
      min = 3,
      max = 100000,
      step = 3,
      label = "Random DNA length")
  ),
  shiny::actionButton(
    inputId = ns("generate_dna"),
    label = "Generate random DNA", style = "margin-top: 18px;"
  )),
  shiny::verbatimTextOutput(outputId = ns("peptide")) |>
    shiny::tagAppendAttributes(style = "white-space: pre-wrap;")

  )
}

#' Peptide Server Functions
#'
#' @noRd
mod_Peptide_server <- function(id){
  moduleServer( id, function(input, output, session){
    dna <- reactiveVal()
    ns <- session$ns
    output$DNA <- renderUI({
      textAreaInput(
        inputId = ns("DNA"),
        label = "DNA sequence",
        placeholder = "Insert DNA sequence",
        value = dna(),
        height = 100,
        width = 600
      )
    })
    observeEvent(input$generate_dna, {
      dna(
        BioSeqR::replicate(input$dna_length)
      )
    })
    output$peptide <- renderText({
      # Ensure input is not NULL and is longer than 2 characters
      if(is.null(input$DNA)){
        NULL
      } else if(nchar(input$DNA) < 3){
        NULL
      } else{
        input$DNA |>
          toupper() |>
          BioSeqR::transcribe() |>
          BioSeqR::get_codons() |>
          BioSeqR::translate()
      }
    })

  })
}

## To be copied in the UI
# mod_Peptide_ui("Peptide_1")

## To be copied in the server
# mod_Peptide_server("Peptide_1")
