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

by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))

# Create a scatter plot showing the change in medianLifeExp over time
ggplot(by_year, aes(x = year, y = medianLifeExp)) +
  geom_point() +
  expand_limits(y = 0)

# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarise(medianGdpPercap = median(gdpPercap), .groups = "drop")

ggplot(by_year_continent, aes(x = year, y = medianGdpPercap), color = continent) +
  geom_point() +
  expand_limits(y = 0 )

# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent, year) %>%
  summarise(medianLifeExp = median(lifeExp), medianGdpPercap = median(gdpPercap), .groups = "drop")

ggplot(by_continent_2007, aes(x = medianGdpPercap, y = medianLifeExp,  color = continent)) +
  geom_point() 







