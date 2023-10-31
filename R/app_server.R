#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  mod_SequenceHandler_server("mod_SequenceHandler_1")
  mod_AAPlot_server("AAPlot_1")
  mod_Translate_DNA_server("Translate_DNA_1")
}
