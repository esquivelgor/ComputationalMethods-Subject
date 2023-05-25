library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize to find the median life expectancy
gapminder %>% 
  summarize(medianLifeExp = median(lifeExp))

# Filter for 1957 then summarize the median life expectancy
gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp))

# Filter for 1957 then summarize the median life expectancy and the maximum GDP per capita
gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# Find median life expectancy and maximum GDP per capita in each year
gapminder %>%
  group_by(year) %>%
  summarise(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# Find median life expectancy and maximum GDP per capita in each continent in 1957
lifeGDPContinent <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

ggplot(lifeGDPContinent, aes(x = medianLifeExp, y = maxGdpPercap, color = continent, size = maxGdpPercap)) +
  geom_point() +
  scale_x_log10()

# Find median life expectancy and maximum GDP per capita in each continent/year combination
gapminder %>%
  group_by(continent, year) %>%
  summarise(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

max(gapminder$year)
