# basetheme #

R package implementing a theming system for base plotting.

## Description ##

The `basetheme()` function provides a way to set and unset R plotting settings.

## Examples ##

Loading the library.


```r
library(basetheme)
```

### Custom clean-ups ###

Default plot:


```r
plot(iris$Sepal.Length, iris$Sepal.Width)
```

![ex1](https://i.imgur.com/ky5f8Qr.png)

Some custom improvements:


```r
basetheme(las=1, tck=-0.01, mgp=c(2,0.7,0), cex.axis=0.7, pch=19, bty="l")

plot(iris$Sepal.Length, iris$Sepal.Width)
```

![ex11](https://i.imgur.com/0MVqglB.png)

### Built-in Themes ###

Using themes provided by the library

**Dark:**


```r
basetheme("dark")
barplot(1:5, col=1:5, main="barplot", ylab="value")
```

![ex2](https://i.imgur.com/EPJElFk.png)

With some customization:


```r
basetheme(rect.col="grey10")
pairs(iris[,1:4], cex=0.3, main="iris")
```

![ex3](https://i.imgur.com/dhOlU85.png)

**Minimal:**


```r
basetheme("minimal")
boxplot(iris$Sepal.Width ~ iris$Species, col=3:5)
```

![ex4](https://i.imgur.com/KHf34Fi.png)

**Void:**

```r
basetheme("void")
boxplot(iris$Sepal.Width ~ iris$Species)
```

![ex7](https://i.imgur.com/pCZowdY.png)

After some additions:

```r
basetheme("void", rect.density=10, rect.col="grey", bg="antiquewhite")
plot(density(rnorm(100)))
```

![ex8](https://i.imgur.com/WdJo0Yp.png)


### Parameter List ###

To see all set parameters:

```r
pars <- basetheme()
```

To obtain all available parametrs with default values:

```r
basetheme_default()
```

### Remove All Themes ###


```r
basetheme(NULL)
plot(1:10)
```

![ex6](https://i.imgur.com/eIhP3tL.png)

## Installation ##

Using **devtools** library:

```r
devtools::install_github("KKPMW/basetheme")
```

## Details ##

Under the hood this library utilizes two hooks that are implemented in the `plot.new()` function:
`before.plot.new` and `plot.new`.

