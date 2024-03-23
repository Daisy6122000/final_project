here::i_am("code/04_violin_plot.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(ggplot2)

violinplot <- 
  ggplot(data, aes(x = factor(cp), y = chol, fill = factor(cp))) +
  geom_violin() +
  labs(x = "Chest Pain Type", y = "Serum Cholesterol Level", fill = "Chest Pain Type") +
  ggtitle("Serum Cholesterol by Chest Pain Type") +
  scale_fill_manual(values = c("#FF9999", "#FFCC99", "#FFFF99", "#CCFF99"),  # Custom colors
                    labels = c("Type 1", "Type 2", "Type 3", "Type 4")) +   # Labels for each type
  theme_minimal()

ggsave(
  here::here("output/violinplot.png"),
  plot = violinplot,
  device = 'png'
)
