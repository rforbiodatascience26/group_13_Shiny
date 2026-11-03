ui <- fluidPage(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )
  ),

  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("Describe what your app does...")
    )
  ),

  # Inputs on the left, plot on the right
  layout_columns(
    col_widths = c(6, 6),

    card(
      card_header("Virtual Gene Generator"),

      sliderInput(
        inputId = "n_bases",
        label = "Number of bases:",
        min = 3,
        max = 60,
        value = 30,
        step = 3
      ),

      numericInput(
        inputId = "bp1", label = "Base Probability A",
        value = 0.25, min = 0, max = 1, step = 0.01
      ),
      numericInput(
        inputId = "bp2", label = "Base Probability T",
        value = 0.25, min = 0, max = 1, step = 0.01
      ),
      numericInput(
        inputId = "bp3", label = "Base Probability C",
        value = 0.25, min = 0, max = 1, step = 0.01
      ),
      numericInput(
        inputId = "bp4", label = "Base Probability G",
        value = 0.25, min = 0, max = 1, step = 0.01
      )
    ),

    card(
      card_header("DNA Base Frequencies"),
      plotOutput("distPlot", height = "400px")
    )
  ),

  # Sequences underneath
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene output"),
      verbatimTextOutput("dna"),
      verbatimTextOutput("rna"),
      verbatimTextOutput("peptide")
    )
  )
)
