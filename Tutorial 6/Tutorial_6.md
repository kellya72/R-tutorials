Tutorial 6: Data Cleaning
================

-   This week's tutorial will focus on how to deal with dates and times and also introduce functions which can be used to clean data.

Dates and Times
---------------

-   Dates and times can come in many different forms. We will look at three functions which can be used to format dates and times in R: `parse_datetime()`, `parse_date()` and `parse_hm()`.

### `parse_datetime()`

-   The `parse_datetime()` function formats both the date and time in one step.

-   The function expects an ISO8601 date-time. ISO8601 is an international standard in which the components of a date are sorted as follows: year, month, day, hour, minute, second.

``` r
parse_datetime("2018-11-17T190711")
```

    ## [1] "2018-11-17 19:07:11 UTC"

-   If you don't add the time into the function, the time is assumed to be midnight.

``` r
parse_datetime("20170319")
```

    ## [1] "2017-03-19 UTC"

### `parse_date()`

-   `parse_date()` formats the date only.

-   The function requires a four digit year, a - or /, the month, a - or /, then the day.

``` r
parse_date("2015-12-11")
```

    ## [1] "2015-12-11"

### `parse_hm()`

-   `parse_hm()` is used for formatting times.

-   You will need to install and load the `hms` package to use this function.

-   The functions takes the format hours then minutes seperated by a `:`.

-   To include seconds you will need to use the `parse_hms()` function.

``` r
parse_hm("02:15")
```

    ## 02:15:00

``` r
parse_hms("21:09:23")
```

    ## 21:09:23

Tidy Data
---------

-   Tidy datasets are much easier to work with in R. When initially reading in a dataset look at how the data is laid out. It is always much easier to tidy up data before starting your analysis as opposed to trying to work around messy data or clean up as you go along.

-   There are three golden rules of a tidy dataset:
    1.  Each variable should have its own column.
    2.  Each observation should have its own row.
    3.  Each value should have its own cell.
-   The `gather()` and `spread()` functions can be used to tidy data.

### `gather()`

-   An issue in some datasets is that sometimes the column names are the values of a variable, as opposed to the name of a variable.

-   An example of this can be seen in `table 1` shown below where the column names `a` and `b` represent values of the `drug` variable, and each row represents two observations, not one.

<!-- -->

    ##     name  a  b
    ## 1 Arthur 67 56
    ## 2   Mary 80 90
    ## 3  Frank 64 50
    ## 4 Sharon 81 87

-   To tidy this dataset we need to gather the two columns into two new variables.

-   To do this we need to establish three seperate parameters:
    1.  The columns which represent the values of a variable and not the variable itself. For this instance, those columns are `a` and `b`.
    2.  The `key`: this is the name of the variable whose values form the column names from point 1. In our example the variable in question is called `drug`.
    3.  The `value`: this is the variable whose values are in the cells corresponding to columns in point 1. In table 1 this is `heartrate`.
-   These parameters are used in the `gather()` function as shown below:

``` r
tidyTable1 <- gather(table1,'a', 'b', key= drug, value= heartrate)
tidyTable1
```

    ##     name drug heartrate
    ## 1 Arthur    a        67
    ## 2   Mary    a        80
    ## 3  Frank    a        64
    ## 4 Sharon    a        81
    ## 5 Arthur    b        56
    ## 6   Mary    b        90
    ## 7  Frank    b        50
    ## 8 Sharon    b        87

-   Alternatively this function can be written as follows:

``` r
tidyTable1 <- table1 %>%
    gather('a', 'b', key= drug, value= heartrate)
```

-   The `%>%` symbol is known as a pipe. It is a symbol which is exclusive to the tidyverse package. For more complex lines of code when you are applying many functions together, the pipe syntax makes it much easier to read the code. However, the use of pipes is not a necessity in R. To find out more about pipes read the read the [pipes](https://r4ds.had.co.nz/pipes.html#pipes) chapter from the [R for Data Science](http://r4ds.had.co.nz/index.html) book.

### spread()

-   Spreading is the opposite of gathering. It is used when an observation is scattered across multiple rows in a dataset.

-   For example in table 2 below, an observation is a person on a particular drug, but each observation is spread across two rows.

<!-- -->

    ##      name drug           type  result
    ## 1  Arthur    a      heartrate      67
    ## 2    Mary    a      heartrate      80
    ## 3   Frank    a      heartrate      64
    ## 4  Sharon    a      heartrate      81
    ## 5  Arthur    a blood pressure  140/90
    ## 6    Mary    a blood pressure  160/10
    ## 7   Frank    a blood pressure   90/60
    ## 8  Sharon    a blood pressure  140/90
    ## 9  Arthur    b      heartrate      56
    ## 10   Mary    b      heartrate      90
    ## 11  Frank    b      heartrate      50
    ## 12 Sharon    b      heartrate      87
    ## 13 Arthur    b blood pressure   70/40
    ## 14   Mary    b blood pressure 179/109
    ## 15  Frank    b blood pressure   99/64
    ## 16 Sharon    b blood pressure  159/99

-   This time around to tidy up the data we need to identify two parameters:
    1.  The `key`: this is the column which contains the names of the variables. For `table 2`, this is `type`.
    2.  The `value`: this is the column which contains the values for the variables from part 1. This is the `result` column in our example.
-   These parameters are used in the `spread()` function as follows:

``` r
tidyTable2 <- table2 %>%
    spread(key=type, value=result)
tidyTable2
```

    ##     name drug blood pressure heartrate
    ## 1 Arthur    a         140/90        67
    ## 2 Arthur    b          70/40        56
    ## 3  Frank    a          90/60        64
    ## 4  Frank    b          99/64        50
    ## 5   Mary    a         160/10        80
    ## 6   Mary    b        179/109        90
    ## 7 Sharon    a         140/90        81
    ## 8 Sharon    b         159/99        87

### `Separate()`

-   In some case you may wish to split one variable into two separate variables.

-   Take `table 3` for example, the result parameter contains both the population and the GDP for each of the countries.

<!-- -->

    ##   country year        result
    ## 1 Ireland 2018   4720234/383
    ## 2 Ireland 2017   4702364/333
    ## 3      UK 2018 66043875/3028
    ## 4      UK 2017 65986342/3780
    ## 5  France 2018 67190324/2776
    ## 6  France 2017 67078375/2582
    ## 7   Italy 2018 60480921/2234
    ## 8   Italy 2017 60397321/1935

-   The following code will seperate the `result` variable into two new variables: `population` and `GDP`.

``` r
table3Separate <- table3 %>% 
                    separate(result, into = c("population", "GDP"))
table3Separate
```

    ##   country year population  GDP
    ## 1 Ireland 2018    4720234  383
    ## 2 Ireland 2017    4702364  333
    ## 3      UK 2018   66043875 3028
    ## 4      UK 2017   65986342 3780
    ## 5  France 2018   67190324 2776
    ## 6  France 2017   67078375 2582
    ## 7   Italy 2018   60480921 2234
    ## 8   Italy 2017   60397321 1935

-   By default, the `separate()` function splits values wherever it sees a non-alphanumeric character (i.e. a character that isn't a number or letter). In our example this was the point where there was a forward slash. However, it is possible to specify a character to separate a column by using the `sep` argument in the function.

``` r
table3Separate <- table3 %>% 
                    separate(result, into = c("population", "GDP"), sep = "/")
```

**Exercise 1: Download and read in [`californiaFires.csv`](https://github.com/kellya72/R-tutorials/blob/master/Tutorial%206/californiaFires.csv). Seperate the `damage` variable into two separate variables: `acresBurned` and `costOfDamage`.**

-   The `sep` argument can also be set to a number which indicates the position at which to split the column.

``` r
table3SplitYear <- table3Separate %>% 
                    separate(year, into = c("century", "year"), sep=2)
table3SplitYear
```

    ##   country century year population  GDP
    ## 1 Ireland      20   18    4720234  383
    ## 2 Ireland      20   17    4702364  333
    ## 3      UK      20   18   66043875 3028
    ## 4      UK      20   17   65986342 3780
    ## 5  France      20   18   67190324 2776
    ## 6  France      20   17   67078375 2582
    ## 7   Italy      20   18   60480921 2234
    ## 8   Italy      20   17   60397321 1935

-   Examine the code and results below to see if you can determine what the negative `sep` value does to the resulting dataframe.

``` r
table3Separate  %>% 
     separate(population, into = c("millions", "thousands"), sep = -6)
```

    ##   country year millions thousands  GDP
    ## 1 Ireland 2018        4    720234  383
    ## 2 Ireland 2017        4    702364  333
    ## 3      UK 2018       66    043875 3028
    ## 4      UK 2017       65    986342 3780
    ## 5  France 2018       67    190324 2776
    ## 6  France 2017       67    078375 2582
    ## 7   Italy 2018       60    480921 2234
    ## 8   Italy 2017       60    397321 1935

**Exercise 2: Using the data frame created in Exercise 1, split the `costOfDamage` into `millions` and `thousands`.**

### `unite()`

-   The `unite()` function is the exact opposite of the `seperate()` function. It is used to combine two columns to make one column.

``` r
table3SplitYear %>%
  unite(year, century, year)
```

    ##   country  year population  GDP
    ## 1 Ireland 20_18    4720234  383
    ## 2 Ireland 20_17    4702364  333
    ## 3      UK 20_18   66043875 3028
    ## 4      UK 20_17   65986342 3780
    ## 5  France 20_18   67190324 2776
    ## 6  France 20_17   67078375 2582
    ## 7   Italy 20_18   60480921 2234
    ## 8   Italy 20_17   60397321 1935

-   The function separates the two values by a `_` by default. This can be changed using the `sep` parameter. In this case we do not want anything separating the two values so we set `sep=""`:

``` r
table3SplitYear %>%
  unite(year, century, year, sep="")
```

    ##   country year population  GDP
    ## 1 Ireland 2018    4720234  383
    ## 2 Ireland 2017    4702364  333
    ## 3      UK 2018   66043875 3028
    ## 4      UK 2017   65986342 3780
    ## 5  France 2018   67190324 2776
    ## 6  France 2017   67078375 2582
    ## 7   Italy 2018   60480921 2234
    ## 8   Italy 2017   60397321 1935

**Exercise 3: Using the dataframe created in Exercise 2, combine the `NUMBER.OF.FIRES` column with the `acresBurned` column, naming that column `fireDamage`. Make sure the two values are separated by a `/` in the new column.**
