# Define the Server (Backend)
server <- function(input, output) {

  dna <- reactive({
    gene_dna(
      length = input$n_bases,
      base_probs = c(input$bp1, input$bp2, input$bp3, input$bp4)
    )
  })

  output$dna <- renderText({
    gsub("(.{60})", "\\1\n",dna())
  })

  
  rna <- reactive({
    transcribe_dna(dna())
  })

  output$rna <- renderText({
    gsub("(.{60})", "\\1\n",rna())
  })

  peptide <- reactive({
    translate_rna(rna())
  })

  output$peptide <- renderText({
    gsub("(.{60})", "\\1\n",peptide())
  })

  freqs <- reactive({
    base_freqs(dna())
  })

  output$distPlot <- renderPlot({
    x <- freqs()

    ggplot(x, aes(x = dna_vec, y = Freq)) +
      geom_col(fill = "#75AADB") +
      labs(
        title = "DNA Base Frequencies",
        x = "DNA base",
        y = "Frequency"
      ) +
      theme_minimal()
  })

}
