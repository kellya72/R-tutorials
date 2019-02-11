Tutorial 4: Data Transformation
================

This weeks tutorial will show you how to read in datasets to R, save datasets as files and deal with missing data. We will also look at the `filter()`, `arrange()` and `select()` functions which are useful for data transformation.

Reading in Data
---------------

-   Ensure you have set the working directory to **R Tutorials**.

-   Download the ['Olive.Rdata'](https://github.com/kellya72/R-tutorials/blob/master/Tutorial%204/olive.Rdata), ['pulse.txt'](https://github.com/kellya72/R-tutorials/blob/master/Tutorial%204/pulse.txt) and ['fastfood\_calories.csv'](https://github.com/kellya72/R-tutorials/blob/master/Tutorial%204/fastfood_calories.csv) files from the Tutorial 4 folder. To dowload the latter two you will need to click the button that says **Raw** on the datasets' Github page and then right click and select **Save As** on the raw Github page.

-   Ensure that you save the files in the **R Tutorials** folder.

-   The function used to read in the individual files depends on the file type.
    -   `read.table()` can be used for reading in most file types which contain data in a table format. The function takes the form `read.table(file, header= FALSE, sep= "")` where `file` is the name of the file. The default value for `header` is `FALSE`, which means that the function assumes the data read in does not have a heading. If this is not the case simply set `header=TRUE`. The `sep` parameter assumes that the data is seperated in the file by a space, tab or new line. However, if the data is seperated by a `;` for example, set `sep= ";"`.

    -   `read.csv()` is used for reading in csv files. The function takes the form `read.csv(file, header= TRUE, sep=",")`. Note that `read.csv()` assumes the data has a heading, however you can change this by setting `header= FALSE`. Also it assumes that the data is seperated by a `,` but this parameter can also be changed.

    -   `load()` is used for reading in `.Rdata` files.

-   Try load the three files into RStudio by running the following code:

``` r
pulseData <- read.table("pulse.txt", header = TRUE)
fastFoodData <- read.csv("fastfood_calories.csv", header = TRUE)
oliveData <- load("Olive.Rdata")
```

-   When reading in data, it is useful to assign names to the input as then the datasets can easily be included in other functions.

-   As the files were saved in the working directory **R Tutorials**, only the file name was needed in the function. However, if the file was saved in another location, the full filepath would need to be included e.g. `read.table("user/downloads/pulse.txt")`. You must use forward slashes in the file path, R will return an error if backwards slashes are used.

Saving Datasets as Files
------------------------

-   It is also possible to save datasets created or worked on in R as files.

-   The `read.table()` function can be used to do this. The function takes the form `read.table(x, file, sep = " ")` where `x` is the name of the dataset in R and `file` is name of the file you wish to create. The `sep` parameter once again is the method by which each row of data is seperated in the resulting file, with the default seperator set to a space.

-   Try running the following code:

``` r
write.table(pulseData, "savedPulse.txt")
```

**Exercise 1: Save `fastFoodData` as a file called `savedFastFood.csv`. Hint: you can use the `read.table()` function to save a csv if you set `sep=","`.**

Missing Data
------------

-   Datasets often can contain missing data.

-   The `complete.cases()` function is used to identify the rows of data which are complete i.e. do not contain missing data.

-   Sometimes it is helpful to take a closer look at cases with missing data as opposed to just deleting them.

-   Run the following code to find any missing data in the `pulseData` dataframe and save them in a new dataframe called `missingData`.

``` r
missingData <- pulseData[!complete.cases(pulseData),]
```

-   The `!` in R is a negative operator, i.e. the code above is searching for cases that are **not** complete.

-   The method of accessing the missing rows of data is the same principle that was used previously when selecting rows in matrices (`matrix[rowsOfInterest, columnsOfInterest]`).

### Analysing the Missing Data

-   The `summary()` function is useful for quickly analysing a dataset.

``` r
summary(missingData)
```

    ##  RestingPulse  Smokes      Weight     
    ##  High:2       No  :4   Min.   :125.0  
    ##  Low :2       Yes :0   1st Qu.:128.2  
    ##  NA's:3       NA's:3   Median :139.0  
    ##                        Mean   :137.2  
    ##                        3rd Qu.:143.8  
    ##                        Max.   :150.0  
    ##                        NA's   :1

-   To access an entire dataset, use the `View()` function.

``` r
View(missingData)
```

### Removing Missing Data

-   After analysing the cases which contain missing elements, sometimes we then wish to remove them from our original dataset.

**Exercise 2: Use the `complete.cases()` function to create a new dataframe called `cleanPulseData` which contains no missing data.**

-   An alternative method of removing missing data is to use the `na.omit()` function:

``` r
cleanPulseData = na.omit(pulseData)
```

Data Tansformation
------------------

-   The `filter()`, `arrange()` and `select()` functions are from the `dplyr` package which is a member of the `tidyverse` packages.

-   Before you continue load the tidyverse package.

### `filter()`

-   The `filter()` function allows you to easily subset observations based on their values.

-   The data to be subsetted is first specified and the subsequent arguments are the expressions that filter the data frame.

-   For example, you may wish to create a subset of cases from `cleanPulseData` containing only individuals who smoke and weigh over 160.

``` r
smokersOver160 <- filter(cleanPulseData, RestingPulse == "Low", Smokes== "Yes", Weight> 160)
head(smokersOver160)
```

    ##   RestingPulse Smokes Weight
    ## 1          Low    Yes    190
    ## 2          Low    Yes    175
    ## 3          Low    Yes    170
    ## 4          Low    Yes    180
    ## 5          Low    Yes    185
    ## 6          Low    Yes    170

**Exercise 3: Create a subset from `cleanPulseData` which contains individuals with a low resting pulse who do not smoke and weight less than 180. Name the subset `lowRateNonSmokers`.**

**Exercise 4: Create a subset containing individuals with a weight that is less than or equal to 170.**

### `arrange()`

-   The `arrange()` function sorts and orders the contents of a dataframe.

``` r
weightOrder <- arrange(cleanPulseData, Weight)
weightOrder[1:5,]
```

    ##   RestingPulse Smokes Weight
    ## 1         High     No     95
    ## 2          Low     No    102
    ## 3          Low    Yes    108
    ## 4          Low     No    108
    ## 5          Low     No    110

-   The data frame is arranged in ascending order by default. However, you can sort the data by descending order using the following code:

``` r
weightOrderDesc <- arrange(cleanPulseData, desc(Weight))
weightOrderDesc[1:5,]
```

    ##   RestingPulse Smokes Weight
    ## 1          Low     No    215
    ## 2          Low     No    195
    ## 3          Low    Yes    190
    ## 4          Low     No    190
    ## 5          Low     No    190

-   It is also possible to include more than one column name in the `arrange()` function.

``` r
smokesAndPulseOrder <- arrange(cleanPulseData,Smokes, RestingPulse)
smokesAndPulseOrder[1:5,]
```

    ##   RestingPulse Smokes Weight
    ## 1         High     No    116
    ## 2         High     No    155
    ## 3         High     No    145
    ## 4         High     No    136
    ## 5         High     No    130

**Exercise 5: Run the above function again but this time input `RestingPulse` into the function before `Smokes`. What effect does this have on the resulting dataset.**

### `select()`

-   The `select()` function allows you select only the variables you are interested in from a data frame.

-   For example, some datasets may contain hundreds of variables but you may only wish to analyse a few of them.

-   `fastFoodData` has 18 variables for each of its 515 observations. The code below shows how the `select()` function can be used to create a new dataset with less variables.

``` r
fastFoodDataSimplified = select(fastFoodData, restaurant, item, calories)
```

**Exercise 6: Use the `select()` function to create a data frame called `fastFoodNutrition` which contains the variables `restaurant`, `item`, `calories`, `total_fat`, `sugar` and `protein`.**
