
# Tutorial 5 Solutions

### Exercise 1
californiaFiresData <- read.csv("californiaFires.csv")
californiaFiresData <- californiaFiresData %>% 
  separate(damage, into = c("acresBurned", "costOfDamage"), sep = "/")
head(californiaFiresData)



### Exercise 2

californiaFiresData <- californiaFiresData  %>% 
  separate(costOfDamage, into = c("millions", "thousands"), sep = -6)
head(californiaFiresData)


### Exercise 3
californiaFiresData <- californiaFiresData %>%
  unite(fireDamage, NUMBER.OF.FIRES, acresBurned, sep="/")
head(californiaFiresData)
