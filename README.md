
Docs for the HPC Cluster are written in R Markdown, and utilize the bookdown package. To contribute, clone this repository, and install R & RStudio to your machine.


In the RStudio console, make sure both are installed:



```
install.packages("rmarkdown")
```

```
install.packages("devtools")
devtools::install_github("rstudio/bookdown")
```


This is the absolute minimum you need to start a [bookdown](https://bookdown.org/home/about.html) book. You can find the
preview of this book at http://seankross.com/bookdown-start/

When contributing, be sure to make your edits to the .Rmd files in the project root directory, build the book in RStudio (Build tab->Build book), and add the changed .Rmd files along with the new build files in the docs directory to your commit. Any manual changes to the build files may be overwritten the next time the book is built.

All of the content of this repository is licensed 
[CC0](https://creativecommons.org/publicdomain/zero/1.0/).
