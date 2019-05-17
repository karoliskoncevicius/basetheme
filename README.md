# basetheme #

R package implementing a theming system for base plotting.

## Description ##

The `basetheme()` function provides a way to set and unset R plotting settings.

## Themes ##

Demonstration using:

```r
pairs(iris[,1:4], col=iris$Species)
legend("bottom", legend=unique(iris$Species), col=unique(iris$Species),
       pch=par("pch"), cex=0.8, horiz=TRUE, bty="n", inset=c(0,1), xpd=TRUE
       )
```

![default](https://i.imgur.com/aXSfYqW.png)

```r
basetheme("clean")
```

![clean](https://i.imgur.com/I45MqM1.png)

```r
basetheme("brutal")
```

![brutal](https://i.imgur.com/xcsMLxN.png)

```r
basetheme("ink")
```

![ink](https://i.imgur.com/P3d810w.png)

```r
basetheme("dark")
```

![dark](https://i.imgur.com/bpwa98x.png)

```r
basetheme("minimal")
```

![minimal](https://i.imgur.com/iHPMv5B.png)

```r
basetheme("void")
```

![void](https://i.imgur.com/oexLiVW.png)


## Usage ##

Everything is done by calling the `basetheme()` function.
There are 4 different modes:

1. Choosing a theme by name

```r
basetheme("clean")
```

2. Specifying a list with theme values

```r
theme <- basetheme_clean()
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

Using **devtools** library:

```r
devtools::install_github("KKPMW/basetheme")
```

## Details ##

Under the hood this library utilizes two hooks that are implemented in the `plot.new()` function:
`before.plot.new` and `plot.new`.

