here::i_am("code/00_clean_data.R")
absolute_path <- here::here("raw_data", "heart.csv")
data <- read.csv(absolute_path, header = TRUE)

library(labelled)
library(gtsummary)

data$gender <- ifelse(
  data$sex == 0, 
  "female", 
  "male"
)

data$fbs1 <- ifelse(
  data$fbs == 0, 
  "false", 
  "true"
)

data$exang1 <- ifelse(
  data$exang == 0, 
  "no", 
  "yes"
)

data$target1 <- ifelse(
  data$target == 1, 
  "Heart Disease Patients", 
  "Healthy People"
)

var_label(data) <- list(
  age = "Age of the individual",
  gender = "Gender",
  cp = "Chest pain type",
  trestbps = " Resting blood pressure (mm Hg)",
  chol = "Serum cholesterol level (mg/dl)",
  fbs1 = "Fasting blood sugar > 120 mg/dl",
  restecg = "Resting electrocardiographic results",
  thalach = "Maximum heart rate achieved",
  exang1 ="Exercise induced angina",
  oldpeak = "ST depression induced by exercise relative to rest",
  slope = "The slope of the peak exercise ST segment",
  ca = "Number of major vessels (0-3) colored by fluoroscopy",
  thal = "Thalassemia type",
  target1 = "Presence of heart disease"
)



saveRDS(
  data, 
  file = here::here("output/data_clean.rds")
)