

### Exercise 1

pulseData <- read.table("pulse.txt", header = TRUE)
fastFoodData <- read.csv("fastfood_calories.csv", header = TRUE)

write.table(fastFoodData, "savedFastFood.csv", sep = ",")


### Exercise 2

cleanPulseData <- pulseData[complete.cases(pulseData),]


### Exercise 3
library(tidyverse)

lowRateNonSmokers <- filter(cleanPulseData, Smokes== "No", Weight< 180)
lowRateNonSmokers[1:10,]


### Exercise 4

lessThanOrEqualTo170 <- filter(cleanPulseData, Weight <= 170)
lessThanOrEqualTo170[1:10,]


### Exercise 5

pulseAndSmokesOrder <- arrange(cleanPulseData, RestingPulse, Smokes)
pulseAndSmokesOrder[1:10,]


### Exercise 6

fastFoodNutrition = select(fastFoodData, restaurant, item, calories, total_fat, sugar, protein)
fastFoodNutrition[1:5,]


### Exercise 7

flights <- mutate(flights, kmPerMinute= distance/air_time)
flights


### Exercise 8

byStartYear <- group_by(playerData, year_start)
summarise(byStartYear, maxYearEnd = max(year_end))


### Exercise 9

byDestAndCarrier <- group_by(flights, dest, carrier)
summarise(byDestAndCarrier, averageDistance = mean(distance))


### Exercise 10

flights %>% 
  group_by(dest, carrier) %>%
  summarise(averageDistance = mean(distance))


### Exercise 11

ggplot(data = playerData, mapping = aes(x= position, y = weight)) + 

  
### Exercise 12

playerData %>% 
  filter(height == "6-8") %>%
  ggplot() + 
  geom_bar(mapping = aes(x = position, fill = position))


### Exercise 13

playerData %>% 
  group_by(college) %>% 
  summarise(minYear = min(year_start)) %>% 
  filter(minYear<=1955) %>% 
  ggplot() + 

