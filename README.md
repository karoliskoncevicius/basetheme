# basetheme #

R package implementing a theming system for base plotting.

## Description ##

The `settheme()` function provides a way to set and unset R plotting settings.

The `gettheme()` function returns a list of paramters for the selected theme.

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
settheme("clean")
```

![clean](https://i.imgur.com/I45MqM1.png)

```r
settheme("brutal")
```

![brutal](https://i.imgur.com/xcsMLxN.png)

```r
settheme("dark")
```

![dark](https://i.imgur.com/WlmcFnj.png)

```r
settheme("ink")
```

![ink](https://i.imgur.com/P3d810w.png)

```r
settheme("subtle")
```

![ink](https://i.imgur.com/bpwa98x.png)

```r
settheme("minimal")
```

![minimal](https://i.imgur.com/iHPMv5B.png)

```r
settheme("void")
```

![void](https://i.imgur.com/oexLiVW.png)


## Usage ##

Everything is done by calling the `settheme()` function.
There are 4 different modes:

1. Choosing a theme by name

```r
settheme("clean")
```

2. Specifying a list with theme values

```r
theme <- settheme_clean()
settheme(theme)
```

3. Specifying the values directly

```r
settheme(pch=19, bg="blue")
```

4. Removing the current theme

```r
settheme()
settheme(NULL)
```

Additional parameters can be specified everytime.
For example if you like a theme (say "minimal") but would like to change a few parameters:

```r
settheme("minimal", bg="grey", pch=1)
```


### Creating a Theme ###

Simplest way is to obtain a default list of values and change them.

Here is an example of creating a grey-ish sheme:

```r
pars <- gettheme("default")
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

settheme(pars)

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

