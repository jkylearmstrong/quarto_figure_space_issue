library('tidyverse')
library('purrr')

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



#########################

generate_table <- function(x) {
  code <- paste(
    "```{r}", "\n",
    "#| label: tbl-", x, "\n",
    "#| tbl-cap: \"Sample ", x, "\"\n\n",
    "tibble::enframe(Sys.info()) %>% \n",
    "  filter(name %in% c('sysname','release','version','machine')) %>%", "\n",
    "  knitr::kable()", "\n",
    "```",
    sep = ""
  )
  return(code)
}

codes <- map(1:100, generate_table)

if (file.exists("eleven.qmd")) {
  file.remove("eleven.qmd")
}


con <- file("eleven.qmd", "w")
for (code in codes) {
  writeLines(code, con)
}
close(con)
