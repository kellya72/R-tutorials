Tutorial 4: Introduction to R Markdown
================

This tutorial will introduce the basics of R Markdown. R Markdown is an
extension in RStudio which allows you to create word documents, pdfs and
presentations within RStudio. It allows you to seamlessly incorporate
data analysis and visualistions created in R into a professionally
looking report.

It allows you to create a report template which can be easily updated in
response to changes in data by simply altering a single line of code.

## Getting Started

  - To create your first R Markdown document open up RStudio.

  - If you haven’t already installed markdown you will first have to run

<!-- end list -->

``` r
install.packages("rmarkdown")`
```

  - Once the R Markdown package is installed click on **File \> New File
    \> R Markdown…**

  - The following box will appear:

![](images/r_markdown_open.png)

  - Enter **First R Markdown Document** into the title box and your name
    in the author box.

  - Click ok.

### The YAML Header

  - At the top of the R Markdown document you just created you will
    notice the following lines of code:

<!-- end list -->

``` r
---
title: "HTML_example"
author: "Jane Doe"
date: "3/25/2019"
output: html_document
---
```

  - This is known as the YAML header.

  - The `output: html_document` line of code states that the output type
    of the document is html. This line can be changed to `pdf_document`,
    `word_document` or `ioslides_presentation` etc depending on the
    document output preference.

### Global Settings

  - You will also notice the following code chunk:

<!-- ![](images/global%20chunk.png) -->

```` r
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
````

  - The `knitr::opts_chunk$set()` function means that any format
    specified between the brackets will automatically apply to all code
    chunks in the document. Any defaults set can be overidden in the
    individual code chunks in the document.

### Including Code in an R Markdown Document

  - The R Markdown Document you have created already contains a brief
    description of how to include code in an R Markdown Document.

  - Note that each code chunk is given a name. The name for the
    individual code chunks can be found between the curly brackets and
    after the letter `r`.

  - It is possible to write code in languages other than R within R
    Markdown, for example Python and SQL.

  - To insert a new code chunk select the following button which can be
    found at the top of your R Script box: ![](images/insert_r_code.png)

**Exercise 1: Read through the writing code information already
contained in the R Markdown document. How would you ensure that only the
output of a code chunk appeared in the final document and not the code
chunk itself? Edit the global options so that code chunks are
automatically hidden in the final document.**

### Knitting the R Markdown Document

  - To generate a report from an R Markdown file you simply need to
    click the knit button at the top of the R Script box:
    ![](images/knit.png)

  - A preview of the document will automatically open which shows how
    the final document looks.

  - If you decide you want to make changes to the document you can then
    do so in RStudio and the final document will be updated when the
    knit button is selected again.

  - The actual document created can be found in the working directory
    where the file is saved.

**Exercise 2: Knit First R Markdown Document as a word document.**

# Markdown Syntax

  - Text in markdown can be formatted using certain markdown commands.
  - For presentations each sub-section is a new slide.

<br>

``` markdown

*italic text*  

**bold text**  



# Section heading  

## Sub-section heading
```

*italic text*

**bold text**

<br>

# Section heading

## Sub-section heading

<br>

### Lists

  - Lists are created as follows.

<br>

``` markdown

Unordered List:

* Item 1
* Item 2
    - Item 2a
    - Item 2b

Ordered List:

1. Item 1
1. Item 2
    i. Item 3a
    i. Item 3b
    
```

<br>

Unordered List:

  - Item 1
  - Item 2
      - Item 2a
      - Item 2b

Ordered List:

1.  Item 1
2.  Item 2
    1.  Item 2a
    2.  Item 2b

<br>

### Figures

  - Figures can be added using.

<!-- end list -->

``` markdown
![](images/Edge_Logo.png)
```

or for html files

``` markdown
<img src="images/Edge_Logo.png" alt="logo" height="100">
```

<br>

![](images/Edge_Logo.png) <br>

<div class="centered">

<img src="images/Edge_Logo.png" alt="logo" height="80">

### Links

URL hyperlinks can be added using

``` markdown
[click here](www.google.com)
```

[click here](www.google.com)

## References

### Cheatsheets

  - [Rmarkdown
    cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf)
  - [Rmarkdown
    reference](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)

### In-depth references

  - For more tips on getting started with R Markdown, the [R Markdown
    site](https://rmarkdown.rstudio.com) contains easy to follow
    tutorials on the basic use of the package.  
  - If you want an in-depth comprehensive look at R Markdown then try
    reading [R Markdown: The Definitive
    Guide](https://bookdown.org/yihui/rmarkdown/) which is a free online
    book.

<br> <br>

## Knitting PDFs (optional)

  - In order to generate PDF’s, you will need to have to install LaTeX.
  - If you have not heard of or installed LaTeX before, it is
    recommended that you install TinyTeX
    (<https://yihui.name/tinytex/>):

<!-- end list -->

``` r
install.packages("tinytex")
tinytex::install_tinytex()  # install TinyTeX
```

The output type in the YAML header can then be changed to
`pdf_document`. Alternatively, you can select pdf from the dropdown box
beside the Knit button.

``` r
---
title: "Untitled"
author: "Aidan Boland"
date: "3/28/2019"
output: pdf_document
---
```
