here::i_am("code/01_make_table1.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(gtsummary)

table_one <- data |>
  select("age", "gender", "cp", "trestbps", "chol", "fbs1", "restecg", "thalach", 
          "exang1", "oldpeak", "slope", "ca", "thal", "target1") |>
  tbl_summary(by = target1) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Presence of heart disease**") |>
  add_overall() |>
  add_p()

saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)
