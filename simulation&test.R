# Load necessary library
library(dplyr)
library(tidyr)

set.seed(853) # For reproducibility

# Simulate reading habits
days <- 100

# Generate base reading for Matt and correlated reading for Ash
matt_reading <- round(runif(days, 0, 100), 0) # Matt's reading pages per day
ash_reading <- matt_reading * runif(1, 0.8, 1.2) + rnorm(days, 0, 10) # Correlated with Matt's
ash_reading <- pmax(0, round(ash_reading, 0)) # Ensure non-negative, round to integer

# Generate independent readings for Jacki, Rol, and Mike
jacki_reading <- round(runif(days, 0, 100), 0)
rol_reading <- round(runif(days, 0, 100), 0)
mike_reading <- round(runif(days, 0, 100), 0)

# Combine into a data frame
readings <- tibble(
  day = 1:days,
  Matt = matt_reading,
  Ash = ash_reading,
  Jacki = jacki_reading,
  Rol = rol_reading,
  Mike = mike_reading
)

# Preview the data
head(readings)



# Test 1-5: Average pages read per person
readings_long <- readings %>%
  pivot_longer(-day, names_to = "undergraduate", values_to = "pages_read")

average_pages <- readings_long %>%
  group_by(undergraduate) %>%
  summarise(average_pages_read = mean(pages_read))

# Display average pages read by each undergraduate
print(average_pages)

# Bonus: Test for correlation between Matt and Ash
correlation_matt_ash <- cor(readings$Matt, readings$Ash)
print(paste("Correlation between Matt and Ash's reading habits:", correlation_matt_ash))


