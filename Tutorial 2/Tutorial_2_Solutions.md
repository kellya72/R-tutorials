Tutorial 2: Solutions
================

### Exercise 1

``` r
testScores <- matrix(c(70,43,81,59,75,59,88,63,68,46,83,61), nrow=4, ncol=3)
testScores
```

    ##      [,1] [,2] [,3]
    ## [1,]   70   75   68
    ## [2,]   43   59   46
    ## [3,]   81   88   83
    ## [4,]   59   63   61

### Exercise 2

``` r
rownames(testScores) <- c("Katie", "Robert","Niamh", "Nick")
testScores
```

    ##        Jan Feb Mar
    ## Katie   70  75  68
    ## Robert  43  59  46
    ## Niamh   81  88  83
    ## Nick    59  63  61

### Exercise 3

``` r
Lucy <- c(61, 64, 70, 63)
testScores <- rbind(testScores, Lucy)
testScores
```

    ##        Jan Feb Mar Apr
    ## Katie   70  75  68  72
    ## Robert  43  59  46  53
    ## Niamh   81  88  83  85
    ## Nick    59  63  61  64
    ## Lucy    61  64  70  63

### Exercise 4

``` r
apply(testScores, 1, max)
```

    ##  Katie Robert  Niamh   Nick   Lucy 
    ##     75     59     88     64     70

### Exercise 5

``` r
testScores["Niamh", "Feb"] <- 78
testScores
```

    ##        Jan Feb Mar Apr
    ## Katie   70  75  68  72
    ## Robert  43  59  46  53
    ## Niamh   81  78  83  85
    ## Nick    59  63  61  64
    ## Lucy    61  64  70  63

### Exercise 6

``` r
testScores["Robert",] <- testScores["Robert",]*1.2
testScores
```

    ##         Jan  Feb  Mar  Apr
    ## Katie  70.0 75.0 68.0 72.0
    ## Robert 51.6 70.8 55.2 63.6
    ## Niamh  81.0 78.0 83.0 85.0
    ## Nick   59.0 63.0 61.0 64.0
    ## Lucy   61.0 64.0 70.0 63.0
