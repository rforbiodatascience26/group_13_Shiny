# Server Logic (Backend)
server <- function(input, output) {
  
  # 1. Reactive DNA sequence
  dna_seq <- reactive({
    gene_dna(
      length = input$n_bases,
      base_probs = c(input$prob_A, input$prob_T, input$prob_C, input$prob_G)
    )
  })
  
  # 2. Reactive RNA sequence (Transcribes DNA)
  rna_seq <- reactive({
    transcribe_dna(dna = dna_seq())
  })
  
  # 3. Reactive Protein sequence (Translates RNA using your function)
  protein_seq <- reactive({
    translate_rna(rna = rna_seq())  # Make sure your function name matches here!
  })
  
  # Render DNA Output
  output$dna <- renderText({
    gsub("(.{60})", "\\1\n", dna_seq())
  })
  
  # Render RNA Output
  output$rna <- renderText({
    gsub("(.{60})", "\\1\n", rna_seq())
  })
  
  # Render Protein Output (Make sure this uses protein_seq())
  output$protein <- renderText({
    gsub("(.{60})", "\\1\n", protein_seq())
  })
  
  # Inside your server function:
  output$base_plot <- renderPlot({
    # Get frequency data frame
    df <- base_freqs(dna_seq())
    
    # Ensure column names match table output (Var1/dna_vec and Freq)
    colnames(df) <- c("Base", "Count")
    
    # Generate bar plot
    ggplot(df, aes(x = Base, y = Count, fill = Base)) +
      geom_col(show.legend = FALSE) +
      scale_fill_manual(values = c("A" = "#4CAF50", "C" = "#2196F3", "G" = "#FFEB3B", "T" = "#F44336")) +
      labs(x = "Nucleotide Base", y = "Count", title = "Base Frequency Distribution") +
      theme_minimal(base_size = 14)
  })
}