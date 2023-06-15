babynames <- babynames::babynames
library(ggplot2)
library(dplyr)

babynames %>%
  select(name)


babynames %>%
  filter(name %in% c("Amy","Christopher"))

# When was each name most common?
mostCommon <- babynames %>%
  group_by(year) %>%
  slice_max(n, n = 1)

babynames %>%
  # Filter for the year 1990
  filter(year == 1990) %>%
  # Sort the number column in descending order 
  arrange(desc(n))


selected_names <- babynames %>%
  # Filter for the names Steven, Thomas, and Matthew 
  filter(name %in% c("Steven", "Thomas", "Matthew"))

# Plot the names using a different color for each name
ggplot(selected_names, aes(x = year, y = n, color = name)) +
  geom_line()
