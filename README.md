[![CRAN version](http://www.r-pkg.org/badges/version/basetheme)](https://cran.r-project.org/package=basetheme)
[![dependencies](https://tinyverse.netlify.com/badge/basetheme)](https://CRAN.R-project.org/package=basetheme)
[![Monthly Downloads](https://cranlogs.r-pkg.org/badges/basetheme)](https://cranlogs.r-pkg.org/badges/basetheme)

# basetheme #

R package implementing a theming system for base plotting.

## Description ##

The `basetheme()` function provides a **persistent** way to set and unset R plotting settings.
All the user has to do is set the theme once and it will be consistenlty applied to all the subsequent plots even after the graphics device is closed.
The function only works with base graphics system, so if you are exclusively working with `ggplot2`, boy, did you install the wrong package.

## Usage ##

### Setting Themes ###

The persistent settings are controlled via the **`basetheme()`** function.
To an extent this function mimics the behaviour and arguments of **`par()`** and has multiple modes of operation.

1. Specifying the `par()` values directly:

```r
basetheme(pch=19, mgp=c(2,.7,0), tck=-.01)
```

2. Choosing a theme by name:

```r
basetheme("clean")
```

3. Using a mix of the above:

```r
basetheme("minimal", bg="grey", pch=1)
```

3. Specifying a list with theme values:

```r
theme <- basetheme("clean")
theme$cex.main <- 2

basetheme(theme)
```

4. Obtaining a list of parameters for the current theme:

```r
basetheme()
```

5. Removing the current theme:

```r
basetheme(NULL)
```

### Controlling Colors ###

In addition to `basetheme()` two additional functions are provided for manipulating colors within the plots: **`num2col()`** and **`lab2col()`**.

1. `num2col()` assings colors to numeric scales and `lab2col()` assings colors to labels.

```r
plot(iris$Sepal.Width, iris$Petal.Width, col=num2col(iris$Petal.Width), pch=19, cex=2)
plot(iris$Sepal.Width, iris$Petal.Width, col=lab2col(iris$Species), pch=19, cex=2)
```

2. Both functions accept arguments for changing color palette:

```r
plot(iris$Sepal.Width, iris$Petal.Width, col=num2col(iris$Petal.Width, pal=heat.colors(10)), pch=19, cex=2)
plot(iris$Sepal.Width, iris$Petal.Width, col=lab2col(iris$Species, pal=1:3), pch=19, cex=2)
```

3. For both functions a reference specifying which values should be colored by what color can be specified.

```r
plot(iris$Sepal.Width, iris$Petal.Width, col=num2col(iris$Petal.Width, ref=1:2), pch=19, cex=2)
plot(iris$Sepal.Width, iris$Petal.Width, col=lab2col(iris$Species, ref=c("setosa")), pch=19, cex=2)
```

4. The functions return a higher-order function when called without the first argument:

```r
# function that colors the values from 0 to 5 with blue
colorblue <- num2col(pal=c("blue", "cornflowerblue", "cyan"), ref=0:5)

plot(iris$Sepal.Width, iris$Petal.Width, col=colorblue(iris$Petal.Width), pch=19, cex=2)
plot(iris$Sepal.Length, iris$Petal.Length, col=colorblue(iris$Petal.Length), pch=19, cex=2)
```

5. Both functions are intergrated with themes, so changing the themes adjust the default palettes of `num2col()` and `lab2col()`

```r
basetheme("brutal")
barplot(1:5, col=lab2col(1:5))
basetheme("royal")
barplot(1:5, col=lab2col(1:5))
```

See documantation and examples for more details.


## Themes ##

### Using Available Themes ###

Demonstration using:

```r
pairs(iris[,1:4], col=lab2col(iris$Species))
legend("bottom", legend=unique(iris$Species), col=lab2col(unique(iris$Species)),
       pch=par("pch"), cex=0.8, horiz=TRUE, bty="n", inset=c(0,1), xpd=TRUE
       )
```

                                                                      |
----------------------------------------------------------------------|------------------------------------------------------------------------
![clean](http://karolis.koncevicius.lt/data/basetheme/clean.png)      | ![dark](http://karolis.koncevicius.lt/data/basetheme/dark.png)
![brutal](http://karolis.koncevicius.lt/data/basetheme/brutal.png)    | ![deepblue](http://karolis.koncevicius.lt/data/basetheme/deepblue.png)
![ink](http://karolis.koncevicius.lt/data/basetheme/ink.png)          | ![royal](http://karolis.koncevicius.lt/data/basetheme/royal.png)
![minimal](http://karolis.koncevicius.lt/data/basetheme/minimal.png)  | ![void](http://karolis.koncevicius.lt/data/basetheme/void.png)


### Creating a Theme ###

Simplest way is to obtain a default list of values and change them.

Here is an example of creating a grey-ish sheme:

```r
pars <- basetheme("default")
pars$palette <- c("black", grey.colors(8))  # numbered colors - shades of grey
pars$bg  <- "white"                         # some colors
pars$fg  <- "gray20"                        # some colors
pars$col <- "gray20"                        # some colors
pars$col.main <- "black"                    # some colors
pars$col.axis <- "gray20"                   # some colors
pars$col.lab  <- "gray20"                   # some colors
pars$family   <-  "mono"                    # change font
pars$lab      <-  c(10,10,7)                # more ticks on axes
pars$cex.axis <-  0.8                       # smaller axis labels
pars$las      <-  1                         # always horizontal axis labels
pars$rect.border <- "black"                 # box around the plot
pars$rect.lwd    <- 4                       # ticker border

basetheme(pars)

barplot(1:9, col=1:9, names=LETTERS[1:9], main="barplot", ylab="heights")

```

![ex9](https://i.imgur.com/qR1T4P7.png)


## Installation ##

From **CRAN**:

```r
install.packages("basetheme")
```

Using **devtools** library:

```r
devtools::install_github("KKPMW/basetheme")
```

To install the **developement version** (stable updates not yet on **CRAN**):

```r
library(devtools)
install_github("KKPMW/basetheme", ref="dev")
```

## Details ##

Under the hood this library utilizes two hooks that are implemented in the `plot.new()` function:
`before.plot.new` and `plot.new`.

## See Also ##

### Packages ###

CRAN:

1. [**prettyB**](https://github.com/jumpingrivers/prettyB)

GitHub:

1. [**styles**](https://github.com/leehazel/styles)

