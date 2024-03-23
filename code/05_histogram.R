here::i_am("code/05_histogram.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(ggplot2)

histogram <- 
  ggplot(data, aes(x = trestbps)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +  
  labs(x = "Resting Blood Pressure", y = "Frequency") +
  ggtitle("Resting Blood Pressure Distribution") +
  theme_minimal()

ggsave(
  here::here("output/histogram.png"),
  plot = histogram,
  device = 'png'
)
