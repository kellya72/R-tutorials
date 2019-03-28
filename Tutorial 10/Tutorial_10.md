  Tutorial 10: R Markdown
================

This tutorial will provide an introduction to R Markdown. R Markdown is an extension in RStudio which allows you to create word documents, pdfs and presentations within RStudio. It allows you to seamlessly incorporate data analysis and visualistions created in R into a professionally looking report.

It allows you to create a report template which can be easily updated in response to changes in data by simply altering a single line of code.

Getting Started
---------------

-   To create your first R Markdown document open up RStudio.

-   Click on **File &gt; New File &gt; R Markdown...**

-   The following box will appear:

![](images/r%20markdown%20open.png)

-   Enter **First R Markdown Document** into the title box and your name in the author box.

-   Click ok.

### The YAML Header

-   At the top of the R Markdown document you just created you will notice the following lines of code:

![](images/yaml.png)

-   This is known as the YAML header.

-   The `output: html_document` line of code states that the output type of the document is html. This line can be changed to `pdf_document`, `word_document` or `ioslides_presentation` etc depending on the document output preference.

### Global Settings

-   You will also notice the following code chunk:

![](images/global%20chunk.png)

-   The `knitr::opts_chunk$set()` function means that any format specified between the brackets will automatically apply to all code chunks in the document. Any defaults set can be overidden in the individual code chunks in the document.

### Including Code in an R Markdown Document

-   The R Markdown Document you have created already contains a brief description of how to include code in an R Markdown Document.

-   Note that each code chunk is given a name. The name for the individual code chunks can be found between the curly brackets and after the letter `r`.

-   It is possible to write code in languages other than R within R Markdown, for example Python and SQL.

-   To insert a new code chunk select the following button which can be found at the top of your R Script box:

![](images/insert%20r%20code.png)

**Exercise 1: Read through the writing code information already contained in the R Markdown document. How would you ensure that only the output of a code chunk appeared in the final document and not the code chunk itself? Edit the global options so that code chunks are automatically hidden in the final document.**

### Knitting th R Markdown Document

-   To generate a report from an R Markdown file you simply need to click the knit button at the top of the R Script box:

![](images/knit.png)

-   A preview of the document will automatically open which shows how the final document looks.

-   If you decide you want to make changes to the document you can then do so in RStudio and the final document will be updated when the knit button is selected again.

-   The actual document created can be found in the working directory where the file is saved.

**Exercise 2: Knit *First R Markdown Document* as a word document.**

### Formatting Text in R Markdown

-   To specify headers in R Markdown you need to use hashtags. A single hashtag at the start of a line will be formatted as the first header, two hashtags result in a second level header and so on.

-   To format text in bold then place two asterisks (\*\*) either side of the text. For italics, place a single asterisk either side.

-   Bullet points can be included by putting a `-` at the start of a line.

-   More information of text formatting and code chunk options can be found in the [R Markdown Cheatsheet](https://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf) and the [R Markdown Reference Guide](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf).

**Exercise 3: Recreate the word document [*First R Markdown Word Document*](https://github.com/kellya72/R-tutorials/blob/master/Tutorial%2010/First_R_Markdown_Word_Document.docx) found in the *Tutorial 10* folder using R Markdown. You will need to download the file from Github before opening.**

Creating Slide Shows
--------------------

-   Changing the output parameter in the YAML header will let you create slide shows in R Markdown.

-   There are different types of presentations you can create, however the main two are as follows:
    -   `ioslides_presentation`- this creates HTML presentations.
    -   `powerpoint_presentation`- this creates PowerPoint presentations.
-   When creating slide presentations in R Markdown, all text formatting and code chunk options are the same as above.

-   A new slide will automatically start with each first or second level header.

-   You can also insert a slide break manually by typing `***` on a new line.

-   Incremental bullet points can be inserted by using `>-` as opposed to `-`.

More Information on R Markdown
------------------------------

-   For more tips on getting started with R Markdown, the [R Markdown site](https://rmarkdown.rstudio.com/lesson-1.html) contains easy to follow tutorials on the basic use of the package.

-   If you want an in-depth comprehensive look at R Markdown then try reading [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/) which is a free online book.
