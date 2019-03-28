Tutorial 6: Solutions
================

### Exercise 1

``` r
californiaFiresData <- read.csv("californiaFires.csv")
californiaFiresData <- californiaFiresData %>% 
                          separate(damage, into = c("acresBurned", "costOfDamage"), sep = "/")
head(californiaFiresData)
```

    ##   X YEAR NUMBER.OF.FIRES acresBurned costOfDamage
    ## 1 1 1933            1994      129210       318636
    ## 2 2 1934            2338      363052       563710
    ## 3 3 1935            1447      127262       165543
    ## 4 4 1936            3805      756696      1877147
    ## 5 5 1937            2907       71312       151584
    ## 6 6 1938            4150      221061       404225

### Exercise 2

``` r
californiaFiresData <- californiaFiresData  %>% 
                          separate(costOfDamage, into = c("millions", "thousands"), sep = -6)
head(californiaFiresData)
```

    ##   X YEAR NUMBER.OF.FIRES acresBurned millions thousands
    ## 1 1 1933            1994      129210             318636
    ## 2 2 1934            2338      363052             563710
    ## 3 3 1935            1447      127262             165543
    ## 4 4 1936            3805      756696        1    877147
    ## 5 5 1937            2907       71312             151584
    ## 6 6 1938            4150      221061             404225

### Exercise 3

``` r
californiaFiresData <- californiaFiresData %>%
                            unite(fireDamage, NUMBER.OF.FIRES, acresBurned, sep="/")
head(californiaFiresData)
```

    ##   X YEAR  fireDamage millions thousands
    ## 1 1 1933 1994/129210             318636
    ## 2 2 1934 2338/363052             563710
    ## 3 3 1935 1447/127262             165543
    ## 4 4 1936 3805/756696        1    877147
    ## 5 5 1937  2907/71312             151584
    ## 6 6 1938 4150/221061             404225
