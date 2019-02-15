Tutorial 1: An Introduction to R
================

This first tutorial will give a brief introduction to R and Rstudio, instruct on how to download the necessary software and outline how to write basic R code.

This is the first in a series of ten tutorials which will explain how to visualise data, perform basic statistical calculations and manipulate and clean data.Towards the end of the course, a tutorial will be provided on the use of Rmarkdown, a package which allows users to produce reports with visualisations easily integrated.

A very useful resource is the [R for Data Science](http://r4ds.had.co.nz/index.html) book which is available for free online. This book covers the tidyverse packages and provides clear worked examples. The tidyverse packages contain useful visualisation, data manipulation and cleaning functions, many of which will be demonstrated in this course.

R and RStudio
-------------

-   R is a the most popular programming language used in the field of statistics. It is a free software environment which can be used to perform data visualisations, data manipulation and a vast array of statistical methods.

-   RStudio is a more user friendly platform to write R code in. It allows users to save scripts containing their code and makes it easier to edit code. Displaying visualisations is also much more easily done using the RStudio platform.

-   Download both R and RStudio using the following links.

    -   <https://www.r-project.org/>

    -   <https://www.rstudio.com/>

-   Ensure you download R before downloading RStudio.

RStudio Layout
--------------

The RStudio interface is layed out as follows:

<img src="images/rstudio_layout.png" width="75%" style="display: block; margin: auto;" />

How to Run Code
---------------

<img src="images/run_line.png" width="75%" style="display: block; margin: auto;" />

-   Alternatively those using Windows can run code chunks by highlighting the block of text and using the Ctrl+Enter keyboard shortcut. On a Mac it's Cmd+Enter.

Basic Operators in R
--------------------

-   Open up a new R script in RStudio by selecting **File &gt; New File &gt; R Script**.

-   The R script is where you will write and edit all your code.

-   Start off by entering the following basic calculations and running each line of code.

`6+3`

`8-2`

`2*5`

`6/3`

-   The \* and / symbols are the multiplication and division symbols in R.

Variable assignment
-------------------

-   When coding in R it is often useful to name an object.

-   The following code assigns the number `3` the name `myNumber`. If you want to access this number again at any point you can by simply typing `myNumber`.

``` r
myNumber <- 3
```

-   The `<-` symbol is similar to an equals sign in R.

-   When naming an object you can not have spaces between words i.e. above we have named our variable `myNumber` as typing `my number` would have resulted in an error. Another alternative would have been to use an underscore in the name (`my_number`).

-   Try running the following code:

``` r
myNumber <- 5
```

-   You will notice if you run `myNumber` now the value `5` will be printed in the console. This is because `myNumber` has now been reassigned the value `5`.

Vectors
-------

-   A vector is a sequence of data elements of the same basic type, for example a list of numbers or a list of names.

-   Members in a vector can also be referred to as components.

-   A vector of variables (or components) is written using the form `c(var1, var2, var3)` in R.

-   Try running the following code in R:

``` r
numberVector <- c(1,5,6,2,10)
stringVector <- c("cat", "dog", "rabbit", "fish")
```

-   In programming the word **string** refers to a sequence of characters i.e. a word or sentence.

-   Note that when making a vector of string variables it is necessary to put each variable in a set of speech marks.

-   It is possible to select values from a vector by using the index of each variable. The third value in a vector would have an index of 3 for example.

``` r
numberVector[3]
```

    ## [1] 6

-   When selecting multiple variables from a vector you need to input the indices of interest as a vector.

``` r
numberVector[c(1,3,4,5)]
```

    ## [1]  1  6  2 10

-   The `:` can be used to quickly select multiple variables. For example, `3:5` would return the components whose indices were `3, 4` and `5`. See how the following code returns the same values as the code written above:

``` r
numberVector[c(1,3:5)]
```

    ## [1]  1  6  2 10

Basic Functions
---------------

-   R allows you to easily find the mean (average) of a group of numbers and their standard deviation (how much the numbers deviate from the mean on average) using the `mean()` and `sd()` functions.

-   Try running the following code:

`mean(numberVector)`

`sd(numberVector)`

-   Repeat the above exercise but this time use the `stringVector` as the input to the functions. What happens?

-   Other useful functions include the `median()`, `length()` and `sum()` functions.

-   Try running the code below. What does each function do?

`median(numberVector)`

`length(stringVector)`

`sum(numberVector)`

Working Directories
-------------------

-   Create a new folder on your desktop and name it **R Tutorials**.

-   This is where you will save all your work from this course.

-   Now you will set the working directory to this file in RStudio by selecting **Session &gt; Set Working Directory &gt; Choose Directory...** and then selecting the **R Tutorials** file.

-   Later on in the course when you are reading in datasets to R you will see the benefits of using a working directory. For now just get in the habit of setting the working directory to the **R Tutorials** file at the start of each session.
