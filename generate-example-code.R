library('tidyverse')
library('purrr')

generate_code <- function(x) {
  code <- paste(
    "```{r}", "\n",
    "#| label: fig-", x, "\n",
    "#| fig-cap: \"Figure ", x, "\"\n\n",
    "ggplot(mtcars, aes(x = wt, y = mpg)) +\n",
    "  geom_point()", "\n",
    "```",
    sep = ""
  )
  return(code)
}

codes <- map(1:100, generate_code)

if (file.exists("ten.qmd")) {
  file.remove("ten.qmd")
}

con <- file("ten.qmd", "w")
writeLines("# Ten\n", con)
writeLines("```{r}\nlibrary('tidyverse')\n```\n", con)
for (code in codes) {
  writeLines(code, con)
}
close(con)



#########################

generate_table <- function(x) {
  code <- paste(
    "```{r}", "\n",
    "#| label: tbl-", x, "\n",
    "#| tbl-cap: \"Table ", x, "\"\n\n",
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
writeLines("# Eleven\n", con)
writeLines("```{r}\nlibrary('tidyverse')\n```\n", con)
for (code in codes) {
  writeLines(code, con)
}
close(con)
