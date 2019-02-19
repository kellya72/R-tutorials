
library(tidyverse)
library(ggplot2)


### Exercise 1
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

### Exercise 2
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cty, colour= class))

### Exercise 3
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

### Exercise 4
ggplot(diamonds, aes(price)) +
  geom_histogram(binwidth = 1000)

### Exercise 5
ggplot(mpg) +
  geom_point(aes(displ, hwy, color = class)) +
  labs(title = "Fuel efficiency generally decreases with engine size",
       subtitle = "Two seaters (sports cars) are an exception because of their light weight",
       caption = "Data from fueleconomy.gov")
