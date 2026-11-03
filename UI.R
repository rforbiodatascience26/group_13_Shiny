# Load needed libraries
library("shiny")
library("bslib")
library("tidyverse")


# Define the User Interface (Frontend)
ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )),
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Generate a DNA sequence"),
      helpText("Input the length of the DNA sequence with the slider, 
               and determine the probabilities of the different nucliotides")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Generator"),
      sliderInput(inputId = "n_bases",
                  label = "Number of bases:",
                  min = 0,
                  max = 99,
                  value = 30,
                  width = "100%",
                  step = 3),
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput(inputId = "prob_A",
                     label = "Probability of A",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_T",
                     label = "Probability of T",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_C",
                     label = "Probability of C",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_G",
                     label = "Probability of G",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1)
      ))),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene output (DNA)"),
      verbatimTextOutput(outputId = "dna")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Transcribed RNA"),
      verbatimTextOutput(outputId = "rna")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Translated Protein Sequence"),
      verbatimTextOutput(outputId = "protein")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Base Frequencies Plot"),
      plotOutput(outputId = "base_plot")
    )
  )
)
