Tutorial 4: Solutions
================

### Exercise 1

``` r
write.table(fastFoodData, "savedFastFood.csv", sep = ",")
```

### Exercise 2

``` r
cleanPulseData <- pulseData[complete.cases(pulseData),]
```

### Exercise 3

``` r
lowRateNonSmokers <- filter(cleanPulseData, Smokes== "No", Weight< 180)
lowRateNonSmokers[1:10,]
```

    ##    RestingPulse Smokes Weight
    ## 1           Low     No    140
    ## 2           Low     No    155
    ## 3           Low     No    165
    ## 4           Low     No    138
    ## 5           Low     No    155
    ## 6           Low     No    145
    ## 7           Low     No    170
    ## 8           Low     No    175
    ## 9           Low     No    135
    ## 10          Low     No    170

### Exercise 4

``` r
lessThanOrEqualTo170 <- filter(cleanPulseData, Weight <= 170)
lessThanOrEqualTo170[1:10,]
```

    ##    RestingPulse Smokes Weight
    ## 1           Low     No    140
    ## 2           Low    Yes    160
    ## 3           Low     No    155
    ## 4           Low     No    165
    ## 5           Low     No    138
    ## 6          High    Yes    160
    ## 7           Low     No    155
    ## 8          High    Yes    153
    ## 9           Low     No    145
    ## 10          Low     No    170

### Exercise 5

``` r
pulseAndSmokesOrder <- arrange(cleanPulseData, RestingPulse, Smokes)
pulseAndSmokesOrder[1:10,]
```

    ##    RestingPulse Smokes Weight
    ## 1          High     No    116
    ## 2          High     No    155
    ## 3          High     No    145
    ## 4          High     No    136
    ## 5          High     No    130
    ## 6          High     No    118
    ## 7          High     No    116
    ## 8          High     No     95
    ## 9          High     No    150
    ## 10         High    Yes    160

### Exercise 6

``` r
fastFoodNutrition = select(fastFoodData, restaurant, item, calories, total_fat, sugar, protein)
fastFoodNutrition[1:5,]
```

    ##   restaurant                                      item calories total_fat
    ## 1  Mcdonalds          Artisan Grilled Chicken Sandwich      380         7
    ## 2  Mcdonalds            Single Bacon Smokehouse Burger      840        45
    ## 3  Mcdonalds            Double Bacon Smokehouse Burger     1130        67
    ## 4  Mcdonalds Grilled Bacon Smokehouse Chicken Sandwich      750        31
    ## 5  Mcdonalds  Crispy Bacon Smokehouse Chicken Sandwich      920        45
    ##   sugar protein
    ## 1    11      37
    ## 2    18      46
    ## 3    18      70
    ## 4    18      55
    ## 5    18      46
