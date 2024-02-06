library(ggplot2)
library(dplyr)
library(tidyr)

# Assuming 'readings' is your data frame from the simulation
# Transform 'readings' from wide to long format for ggplot
readings_long <- readings %>%
  pivot_longer(-day, names_to = "undergraduate", values_to = "pages_read")

# Create the plot
ggplot(readings_long, aes(x = day, y = pages_read, color = undergraduate)) +
  geom_line() +
  theme_minimal() +
  labs(title = "Daily Pages Read by Each Undergraduate Over 100 Days",
       x = "Day",
       y = "Pages Read",
       color = "Undergraduate") +
  scale_color_manual(values = c("Matt" = "blue", "Ash" = "red", "Jacki" = "green", "Rol" = "purple", "Mike" = "orange"))


