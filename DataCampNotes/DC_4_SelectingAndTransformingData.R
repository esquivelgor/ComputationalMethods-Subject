library(tidyverse)
data(mpg)
?mpg

glimpse(mpg)

mpg %>% 
  select(manufacturer:cyl, cty, hwy) %>%
  arrange(desc(hwy))

mpg %>%
  select(ends_with("y")) %>%
  filter(hwy > 20)

mpg %>%
  count(manufacturer) %>%
  rename(num_models = n)
