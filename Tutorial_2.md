Tutorial 2: Vectors and Matrices
================

This week's tutorial will provide a more in depth look at vectors and introduce matrices. Useful functions for data manipulation such as `rbind`, `cbind` and `apply` will also feature.

-   Before you start on this weeks tutorial, open a new R Script in RStudio and set the working directory to the **R Tutorials** file from last week.

The Help Function
-----------------

-   The help function is a very useful tool in R.

-   Adding a `?` before any function will load a help file on that function which details what it does, the parameters it takes and provides examples of its use.

-   Run `?mean` and examine the help file shown.

Matrices in R
-------------

-   A matrix is a two dimensional array of data.

-   A matrix is created in R using the `matrix` function which takes the format `matrix(data, nrow, ncol, byrow= FALSE)` where `data` is the input to the matrix, `nrow` is the number of rows in the matrix and `ncol` is the number of columns. By default the matrix is filled by column, however this can be changed to by row by setting the `byrow` parameter equal to `TRUE`.

-   Below is an example of how to create a basic matrix with the resulting matrix shown underneath:

``` r
myMatrix <- matrix(c(1,3,4,7,2,1,9,5,3), nrow=3, ncol= 3)
myMatrix
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    7    9
    ## [2,]    3    2    5
    ## [3,]    4    1    3

**Exercise 1: Recreate the matrix shown below in R and name it `testScores`.**

    ##      [,1] [,2] [,3]
    ## [1,]   70   75   68
    ## [2,]   43   59   46
    ## [3,]   81   88   83
    ## [4,]   59   63   61

Naming Rows and Columns
-----------------------

-   It is possible to name the rows and columns in a matrix using the `rownames()` and `colnames()` functions.

-   Firstly, name the columns in `testScores` by typing the following code:

``` r
colnames(testScores) <- c("Jan", "Feb", "Mar")
```

**Excerise 2: Name the rows in testScores Katie, Robert, Niamh and Nick.**

Selecting values in a Matrix
----------------------------

-   Similar to vectors, variables in a matrix are selected using indices. However this time to get a specific variable you must input two indices; the row index and the column index.

-   To select the value in the first row and third column of a matrix you would use the following format: `matrixName[1,3]`. Note that the row index is specified first and then column index second, after a comma.

-   Some examples of selecting values from matrices are shown below. Do you understand the output returned by each line of code?

``` r
myMatrix[2,3]
```

    ## [1] 5

``` r
myMatrix[1:2,3]
```

    ## [1] 9 5

-   It is possible to select an entire row or column from a matrix.

``` r
myMatrix[1,]
```

    ## [1] 1 7 9

``` r
myMatrix[,2]
```

    ## [1] 7 2 1

Selecting Values using Row and Column Names
-------------------------------------------

-   One useful element of naming rows and columns is that they can be used to select variables in the matrix. This is especially useful when trying to access data in a large matrix.

-   Try running the code below yourself, checking that you get the same answers.

``` r
testScores["Niamh","Feb"]
```

    ## [1] 88

``` r
testScores["Nick", c("Jan", "Mar")]
```

    ## Jan Mar 
    ##  59  61

``` r
testScores[,"Feb"]
```

    ##  Katie Robert  Niamh   Nick 
    ##     75     59     88     63

Rbind and Cbind
---------------

-   The `rbind` and `cbind` functions allow you to add rows and columns to an existing matrix respectively.

-   For example, if we wanted to add test scores from April to the existing `testScores` matrix we would do so as follows:

``` r
Apr <- c(72,53,85,64)
testScores <- cbind(testScores, Apr)
testScores
```

    ##        Jan Feb Mar Apr
    ## Katie   70  75  68  72
    ## Robert  43  59  46  53
    ## Niamh   81  88  83  85
    ## Nick    59  63  61  64

-   Run the code above before starting Exercise 3.

**Exercise 3: The testScores matrix is missing a student named Lucy. Use the `rbind()` function to add her scores in. Lucy has test scores of 61, 64, 70 and 63 for the months of January, February, March and April respectively.**

The Apply Function
------------------

-   The `apply()` function returns the result obtained when a set function is applied to a matrix.

-   The function takes the following format: `apply(X, MARGIN, FUN)` where `X` is the matrix and `FUN` is the chosen function. The `MARGIN` parameter refers to whether you wish to apply the function to the rows or columns of the matrix. `MARGIN` is set to `1` for rows and `2` for columns.

-   For example, if you wanted to find the average test score for each month you would do the following:

``` r
apply(testScores, 2, mean)
```

    ##  Jan  Feb  Mar  Apr 
    ## 62.8 69.8 65.6 67.4

**Exercise 4: Find each individuals max test score. Hint: use the `max()` function.**

Editing Data in Matrix
----------------------

-   It is very easy to access and edit data in a matrix.

-   For example, from looking at the average test score values by month in `testScores`, it was thought that the January test must have been too hard. As a result, it was decided that each student would get 5 extra marks for their January test.

-   The code below shows how to make the necessary charges to the matrix.

``` r
testScores[,"Jan"]= testScores[,"Jan"]+5
testScores
```

    ##        Jan Feb Mar Apr
    ## Katie   75  75  68  72
    ## Robert  48  59  46  53
    ## Niamh   86  88  83  85
    ## Nick    64  63  61  64
    ## Lucy    66  64  70  63

-   The following exercises are more challenging that the previous ones. If you are comfortable with the material so far give them a go.

**Exercise 5: It was discovered that Niamh's February test score was inputted incorrectly and should be 78 instead of 88. Make the necessary update to `testScores`.**

**Exercise 6: Robert has appealed his test scores and as a result has been granted a 20% increase in the marks received for each test. Update `testScores` with Robert's new result.**
