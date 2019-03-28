Tutorial 7: Solutions
================

### Exercise 1

``` r
airlines %>% 
  count(carrier) %>% 
  filter(n > 1)
```

    ## # A tibble: 0 x 2
    ## # ... with 2 variables: carrier <chr>, n <int>

### Exercise 2

``` r
flights2 <- select(flights, flight, origin, dest, tailnum)
flights2 <- flights2 %>%
              left_join(planes, by= "tailnum")
head(flights2)
```

    ## # A tibble: 6 x 12
    ##   flight origin dest  tailnum  year type  manufacturer model engines seats
    ##    <int> <chr>  <chr> <chr>   <int> <chr> <chr>        <chr>   <int> <int>
    ## 1   1545 EWR    IAH   N14228   1999 Fixe~ BOEING       737-~       2   149
    ## 2   1714 LGA    IAH   N24211   1998 Fixe~ BOEING       737-~       2   149
    ## 3   1141 JFK    MIA   N619AA   1990 Fixe~ BOEING       757-~       2   178
    ## 4    725 JFK    BQN   N804JB   2012 Fixe~ AIRBUS       A320~       2   200
    ## 5    461 LGA    ATL   N668DN   1991 Fixe~ BOEING       757-~       2   178
    ## 6   1696 EWR    ORD   N39463   2012 Fixe~ BOEING       737-~       2   191
    ## # ... with 2 more variables: speed <int>, engine <chr>

### Exercise 3

``` r
top5dest <- flights %>%
  count(dest, sort = TRUE) %>%
  head(5)
flightsTop5dest <- flights %>% 
  semi_join(top5dest)
```

    ## Joining, by = "dest"

``` r
head(flightsTop5dest)
```

    ## # A tibble: 6 x 19
    ##    year month   day dep_time sched_dep_time dep_delay arr_time
    ##   <int> <int> <int>    <int>          <int>     <dbl>    <int>
    ## 1  2013     1     1      554            600        -6      812
    ## 2  2013     1     1      554            558        -4      740
    ## 3  2013     1     1      557            600        -3      838
    ## 4  2013     1     1      558            600        -2      753
    ## 5  2013     1     1      558            600        -2      924
    ## 6  2013     1     1      559            559         0      702
    ## # ... with 12 more variables: sched_arr_time <int>, arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>,
    ## #   time_hour <dttm>

### Exercise 4

``` r
airlines %>% 
  anti_join(flights, by = "carrier")
```

    ## # A tibble: 0 x 2
    ## # ... with 2 variables: carrier <chr>, name <chr>
