library(purrr)

generate_code <- function(x) {
  code <- paste(
    "```{r}", "\n",
    "#| label: fig-", x, "\n",
    "#| fig.cap: \"Sample ", x, "\"\n\n",
    "ggplot(mtcars, aes(x = wt, y = mpg)) +\n",
    "  geom_point()", "\n",
    "```",
    sep = ""
  )
  return(code)
}

codes <- map(11:100, generate_code)

# Example usage

# Write codes to file
con <- file("output.txt", "w")
for (code in codes) {
  writeLines(code, con)
}
close(con)
