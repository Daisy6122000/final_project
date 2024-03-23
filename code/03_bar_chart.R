here::i_am("code/03_bar_chart.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(ggplot2)

barchart <- 
  ggplot(data, aes(x = sex, fill = factor(target))) +
  geom_bar(position = "dodge") +
  labs(x = "Gender", y = "Count", fill = "Heart Disease") +
  ggtitle("Heart Disease Presence by Gender") +
  scale_fill_manual(values = c("lightblue", "pink"), labels = c("No", "Yes")) + 
  theme_minimal()

ggsave(
  here::here("output/barchart.png"),
  plot = barchart,
  device = 'png'
)
