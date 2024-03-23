here::i_am("code/02_models.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(gtsummary)

logistic_regression_model <- glm(target ~ age + sex + cp + trestbps + chol 
                                 + fbs + restecg + thalach + exang + oldpeak 
                                 + slope + ca + thal, 
                                 family="binomial", data = data)

logistic_regression_table <-
  tbl_regression(logistic_regression_model) |>
  add_global_p()

library(knitr)
library(kableExtra)

#Obtain both odds ratios and 95% CI 
OR_CI = exp(cbind(OR = coef(logistic_regression_model), confint(logistic_regression_model)))
# Store the odds ratios and confidence intervals in a data frame
OR_CI_df = as.data.frame(round(OR_CI, 2))

# Create a table using kable
odds_ratio_table <- kable(OR_CI_df, caption = "<span style='color:black'>**Table 2. Odds Ratios and 95% Confidence Intervals**") %>%
  kable_styling()


saveRDS(
  logistic_regression_table,
  file = here::here("output/logistic_regression_table.rds")
)

saveRDS(
  logistic_regression_table,
  file = here::here("output/odds_ratio_table.rds")
)
