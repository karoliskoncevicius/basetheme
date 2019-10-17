[![CRAN version](http://www.r-pkg.org/badges/version/basetheme)](https://cran.r-project.org/package=basetheme)
[![dependencies](https://tinyverse.netlify.com/badge/basetheme)](https://CRAN.R-project.org/package=basetheme)
[![Monthly Downloads](https://cranlogs.r-pkg.org/badges/basetheme)](https://cranlogs.r-pkg.org/badges/basetheme)

# basetheme #

R package implementing a theming system for base plotting.

## Description ##

The `basetheme()` function provides a **persistent** way to set and unset R plotting settings.
All the user has to do is set the theme once and it will be consistently applied to all the subsequent plots even after the graphics device is closed.
The function only works with base graphics system, so if you are exclusively working with `ggplot2`, boy, did you install the wrong package.

## Usage ##

The persistent settings are controlled via the `basetheme()` function.
To an extent this function mimics the behaviour and arguments of `par()` and has multiple modes of operation:

```r
# Specifying the `par()` values directly:
basetheme(pch=19, mgp=c(2,.7,0), tck=-.01)

# Choosing a theme by name:
basetheme("clean")

# Using a mix of the above:
basetheme("minimal", bg="grey", pch=1)

# Specifying a list with theme values:
theme <- basetheme("clean")
theme$cex.main <- 2
basetheme(theme)

# Obtaining a list of parameters for the current theme:
basetheme()

# Removing the current theme:
basetheme(NULL)
```

In addition to `basetheme()` two additional functions are provided for colors manipulation within the plots: `num2col()` and `lab2col()`.
See documentation: `help(basetheme)`, `help(num2col)`, `help(lab2col)` and examples: `example(basetheme)`, `example(num2col)`, `example(lab2col)` for more details.

## Some Examples ##

A few examples using `iris` dataset for how it all works together.

| Colored by scale (theme = royal)                       |  Colored by label (theme = deepblue)               |
|--------------------------------------------------------|----------------------------------------------------|
| basetheme("royal")                                     | basetheme("deepblue")                              |
| pairs(iris[,1:4], bg=num2col(iris$Sepal.Width), col=0) | pairs(iris[,1:4], bg=lab2col(iris$Species), col=0) |
| ![](https://camo.githubusercontent.com/97ac10e27e48e4482312d5fda34910736dc18393/687474703a2f2f6b61726f6c69732e6b6f6e63657669636975732e6c742f646174612f626173657468656d652f62727574616c2e706e67)                                                  | ![](https://camo.githubusercontent.com/97ac10e27e48e4482312d5fda34910736dc18393/687474703a2f2f6b61726f6c69732e6b6f6e63657669636975732e6c742f646174612f626173657468656d652f62727574616c2e706e67)                                              |

## More Details ##

Additional details can be found in the Wiki pages:

1. [List of Available Themes](https://github.com/KKPMW/basetheme/wiki/Theme-List)
2. [Creating Custom Themes](https://github.com/KKPMW/basetheme/wiki/Creating-Themes)
3. [Installation Instructions](https://github.com/KKPMW/basetheme/wiki/Installation)
4. [Implementation Details](https://github.com/KKPMW/basetheme/wiki/Implementation-Details)

## See Also ##

CRAN:

1. [**prettyB**](https://github.com/jumpingrivers/prettyB)

GitHub:

1. [**styles**](https://github.com/leehazel/styles)

