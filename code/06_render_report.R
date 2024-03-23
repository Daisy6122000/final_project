library("rmarkdown")

here::i_am("code/06_render_report.R")

render(
  here::here("report.Rmd"),
  knit_root_dir = here::here()
)
