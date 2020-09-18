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

A few examples using of how it all works together.

```r
basetheme("void")
boxplot(split(iris$Sepal.Width, iris$Species))
```

![](http://karolis.koncevicius.lt/data/basetheme/examples/ex_1a.png)

```r
basetheme("clean")
barplot(rivers, col=num2col(rivers))
```

![](http://karolis.koncevicius.lt/data/basetheme/examples/ex_2a.png)

```r
basetheme("brutal")
plot(hclust(dist(USArrests), "ward.D2"), hang=-1)
```

![](http://karolis.koncevicius.lt/data/basetheme/examples/ex_3a.png)

```r
basetheme("royal")
pairs(iris[-5], bg=lab2col(iris$Species), col=0)
```

![](http://karolis.koncevicius.lt/data/basetheme/examples/ex_4a.png)

```r
basetheme("deepblue")
pairs(iris[-5], bg=num2col(iris[,1]), col=0)
```

![](http://karolis.koncevicius.lt/data/basetheme/examples/ex_5a.png)

```r
x <- seq(-1.95, 1.95, length = 30)
y <- seq(-1.95, 1.95, length = 35)
z <- outer(x, y, function(a, b) a*b^2)

basetheme("dark")
persp(x, y, z, theta=-45)
```

![](http://karolis.koncevicius.lt/data/basetheme/examples/ex_6a.png)


## More Details ##

Additional details can be found in the Wiki pages:

1. [List of Available Themes](https://github.com/karoliskoncevicius/basetheme/wiki/Theme-List)
2. [Creating Custom Themes](https://github.com/karoliskoncevicius/basetheme/wiki/Creating-Themes)
3. [Installation Instructions](https://github.com/karoliskoncevicius/basetheme/wiki/Installation)
4. [Implementation Details](https://github.com/karoliskoncevicius/basetheme/wiki/Implementation-Details)

## See Also ##

CRAN:

1. [**prettyB**](https://github.com/jumpingrivers/prettyB)

GitHub:

1. [**styles**](https://github.com/leehazel/styles)

