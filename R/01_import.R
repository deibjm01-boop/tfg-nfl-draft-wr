library(readxl)

NFL_COMBINE_TFG <- read_excel(
  "data/TFG.xlsx",
  col_types = c(
    "text","text","text","text","text",
    "numeric","numeric","numeric","numeric","numeric",
    "numeric","numeric","numeric",
    "text","text","text",
    "numeric","numeric","numeric","numeric",
    "numeric","numeric","numeric","numeric",
    "numeric","numeric","numeric","numeric",
    "text","text"
  )
)

NFL_COMBINE_TFG <- NFL_COMBINE_TFG[, !(colnames(NFL_COMBINE_TFG) %in%
  c("Pos","...25","...26","...27","...28","...29","...30"))]

NFL_COMBINE_TFG <- NFL_COMBINE_TFG[, !(colnames(NFL_COMBINE_TFG) %in%
  c("Player","School","Team","Division","Pick","Year"))]
