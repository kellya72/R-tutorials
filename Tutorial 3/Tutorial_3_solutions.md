Tutorial 3: Solutions
================

### Exercise 1

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
```

![](Tutorial_3_solutions_files/figure-markdown_github/ex1-1.png)

### Exercise 2

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cty, colour= class))
```

![](Tutorial_3_solutions_files/figure-markdown_github/ex2-1.png)

### Exercise 3

``` r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))
```

![](Tutorial_3_solutions_files/figure-markdown_github/ex3-1.png)

### Exercise 4

``` r
ggplot(diamonds, aes(price)) +
  geom_histogram(binwidth = 1000)
```

![](Tutorial_3_solutions_files/figure-markdown_github/ex4-1.png)
