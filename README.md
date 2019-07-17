[![CRAN version](http://www.r-pkg.org/badges/version/basetheme)](https://cran.r-project.org/package=basetheme)
[![dependencies](https://tinyverse.netlify.com/badge/basetheme)](https://CRAN.R-project.org/package=basetheme)
[![Monthly Downloads](https://cranlogs.r-pkg.org/badges/basetheme)](https://cranlogs.r-pkg.org/badges/basetheme)

# basetheme #

R package implementing a theming system for base plotting.

## Description ##

The `basetheme()` function provides a **persistent** way to set and unset R plotting settings.
All the user has to do is set the theme once and it will be consistenlty applied to all the subsequent plots.
Even after the graphics device is closed.

## Themes ##

Demonstration using:

```r
pairs(iris[,1:4], col=iris$Species)
legend("bottom", legend=unique(iris$Species), col=unique(iris$Species),
       pch=par("pch"), cex=0.8, horiz=TRUE, bty="n", inset=c(0,1), xpd=TRUE
       )
```

![default](http://karolis.koncevicius.lt/data/basetheme/default.png)

```r
basetheme("clean")
```

![clean](http://karolis.koncevicius.lt/data/basetheme/clean.png)

```r
basetheme("brutal")
```

![brutal](http://karolis.koncevicius.lt/data/basetheme/brutal.png)

```r
basetheme("ink")
```

![ink](http://karolis.koncevicius.lt/data/basetheme/ink.png)

```r
basetheme("dark")
```

![dark](http://karolis.koncevicius.lt/data/basetheme/dark.png)

```r
basetheme("deepblue")
```

![deepblue](http://karolis.koncevicius.lt/data/basetheme/deepblue.png)

```r
basetheme("royal")
```

![deepblue](http://karolis.koncevicius.lt/data/basetheme/royal.png)

```r
basetheme("minimal")
```

![minimal](http://karolis.koncevicius.lt/data/basetheme/minimal.png)

```r
basetheme("void")
```

![void](http://karolis.koncevicius.lt/data/basetheme/void.png)


## Usage ##

Everything is done by calling the `basetheme()` function.
There are 4 different modes:

1. Choosing a theme by name

```r
basetheme("clean")
```

2. Specifying a list with theme values

```r
theme <- basetheme("clean")
theme$cex.main <- 2

basetheme(theme)
```

3. Specifying the values directly

```r
basetheme(pch=19, bg="blue")
```

4. Removing the current theme

```r
basetheme(NULL)
```

5. Obtaining list of theme parametrs

```r
# current theme
basetheme()
# specified theme
theme <- basetheme("clean")
```

Additional parameters can be specified everytime.
For example if you like a theme (say "minimal") but would like to change a few parameters:

```r
basetheme("minimal", bg="grey", pch=1)
```


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

