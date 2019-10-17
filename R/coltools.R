#' Numbers to Colors
#'
#' Assigns colors to the provided vector of numbers.
#'
#' This function interpolates a given set of colors to a numeric vector.
#' Main use case is in turning numbers into colors for plots,
#' especially when different ranges of \code{x} have to be colored differently.
#'
#' Color of NA values and values outside of \code{ref} range can be set using \code{NAcol} argument.
#' Set this to NA to omit the display of such values.
#'
#' In case only a single color is provided - it is expanded by using tints and shades.
#'
#' When \code{x} is not specified - a function that generates colors based on
#' \code{pal} and \code{ref} is returned.
#'
#' @param x numeric vector (factors are transformed to numeric)
#' @param pal colors used to build the palette (defaults to colors set by theme)
#' @param ref reference for assigning colors (defaults to the range of \code{x})
#' @param NAcol color to be used for NA values (defaults to color set by theme)
#'
#' @return a vector of colors for each element in \code{x} or, when \code{x} is missing, a function.
#'
#' @examples
#'  plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg), pch=19, cex=2)
#'
#'  plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, ref=c(20, 35)), pch=19, cex=2)
#'
#'  plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, ref=c(20,35), NAcol=NA), pch=19, cex=2)
#'
#'  cols <- c("lightblue", "cornflowerblue", "orange", "red")
#'  plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, cols), pch=19, cex=2)
#'
#'  plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, c("green", "red")), pch=19, cex=2)
#'
#' @seealso \code{lab2col}
#'
#' @author Karolis Koncevičius
#' @export
num2col <- function(x, pal, ref=range(x, na.rm=TRUE), NAcol) {
  if(missing(pal)) {
    pal <- basetheme()$palette.numbers
  }
  if(is.null(pal)) {
    pal <- c("blue", "#007FFF", "cyan", "#7FFF7F", "yellow", "#FF7F00", "red")
  }

  if(length(pal) == 1) {
    pal <- colshade(pal, c(-0.8, -0.5, -0.3, 0, 0.3, 0.5, 0.8))
  }

  if(missing(NAcol)) {
    NAcol <- basetheme()$palette.missing
  }
  if(is.null(NAcol)) {
    NAcol <- "#B9BBB6"
  }

  ramp <- colorRamp(pal)
  min <- min(ref, na.rm=TRUE)
  max <- max(ref, na.rm=TRUE)

  fun <- function(x) {
    if(is.factor(x)) x <- as.numeric(x)
    x[x < min | x > max] <- NA
    x <- x - min
    x <- x / (max-min)

    cols <- x
    cols[] <- NAcol
    cols[!is.na(x)] <- rgb(ramp(x[!is.na(x)]), maxColorValue=255)
    cols
  }

  if(missing(x)) {
    fun
  } else {
    fun(x)
  }
}

#' Labels to Colors
#'
#' Assigns colors to the provided vector of labels.
#'
#' This function assigns colors to each unique level of label vector \code{x}.
#' Mainly used for consistently assigning colors to a unique set of labels,
#' especially when the order of original labels might change (see examples).
#'
#' Color of NA values and values outside of specified reference can be set using
#' \code{NAcol} argument. Set this to NA to omit the display of such values.
#'
#' \code{ref} parameter can be specified to select the order of color assignment:
#' first element from \code{ref} will be assigned the first color from \code{pal},
#' second element - second color, and so on.
#'
#' The list of provided colors is expanded by first adding shades and then adding
#' tints. However if the number of groups exceeds the number of provided colors
#' by more than 3 times the colors will be repeated.
#'
#' When \code{x} is not specified - a function that generates colors based on
#' \code{pal} and \code{ref} is returned.
#'
#' @param x vector of labels (always transformed to character)
#' @param pal colors used to build the palette (defaults to colors set by theme)
#' @param ref reference for assigning colors (defaults to elements of \code{x})
#' @param NAcol color to be used for NA values (defaults to color set by theme)
#'
#' @return a vector of colors for each element in \code{x} or, when \code{x} is missing, a function.
#'
#' @examples
#'  pairs(iris[,1:4], col=lab2col(iris$Species))
#'
#'  labs1 <- c("A", "B", "C", "D", "E")
#'  labs2 <- c("D", "C", "E", "A", "B")
#'  labs3 <- c("A", "A", "C", "F", "B")
#'  par(mfrow=c(2,2))
#'  barplot(1:5, names=labs1, col=lab2col(labs1))
#'  barplot(1:5, names=labs2, col=lab2col(labs2, ref=labs1))                # color orders are preserved
#'  barplot(1:5, names=labs3, col=lab2col(labs3, ref=labs1))                # new levels are treated as missing
#'  barplot(1:5, names=labs3, col=lab2col(labs3, ref=labs1, NAcol="black")) # "missing" color can be adjusted
#'
#'  ref <- sort(unique(mtcars$cyl))
#'  col <- c("pink", "red", "darkred")
#'  plot(mtcars$hp, mtcars$mpg, col=lab2col(mtcars$cyl, col, ref), pch=19)
#'  legend("topright", legend=ref, fill=col, title="cylinders")
#'
#' @seealso \code{lab2col}
#'
#' @author Karolis Koncevičius
#' @export
lab2col <- function(x, pal, ref=x, NAcol) {
  if(missing(pal)) {
    pal <- basetheme()$palette.labels
  }
  if(is.null(pal)) {
    pal <- c("#5DA5DA", "#FAA43A", "#60BD68", "#F15854", "#B276B2", "#8D4B08", "#DECF3F", "#F17CB0", "#66E3D9", "#00FF7F")
  }

  if(missing(NAcol)) {
    NAcol <- basetheme()$palette.missing
  }
  if(is.null(NAcol)) {
    NAcol <- "#B9BBB6"
  }

  pal <- rep_len(pal, length(pal) * 3)
  pal <- colshade(pal, rep(c(0, 0.5, -0.5), each=length(pal)/3))

  vals <- unique(ref)
  if(length(vals) > length(pal))
    warning("number of unique values exceeds the number of colors in the palette by more than 3 times")
  pal  <- rep_len(pal, length(vals))

  fun <- function(x) {
    if(is.numeric(x)) x <- as.character(x)

    cols <- pal[match(x, vals)]
    cols[is.na(cols)] <- NAcol
    cols
  }

  if(missing(x)) {
    fun
  } else {
    fun(x)
  }
}


#' Add Shade to Color
#'
#' Adds a selected amount of shade or tint to a vector of colors.
#'
#' This function adds shades and tints to provided list of colors.
#' Shade or tint is decided depending on the sign of the \code{frac} argument:
#' positive values make colors darker and negative values lighten them.
#'
#' @param cols a vector of colors
#' @param frac a vector of shade fractions (between -1 and 1, defaults to 0)
#'
#' @return a vector of colors with added shades or tints.
#'
#' @examples
#'  barplot(1:11, col=colshade("red", frac=seq(-1,1,0.2)))
#'
#' @author Karolis Koncevičius
colshade <- function(cols, frac=0) {
  if(any(frac < -1 | frac > 1)) stop('"frac" must be between -1 and 1')
  if(length(frac) <= length(cols)) {
    frac <- rep_len(frac, length(cols))
  } else {
    cols <- rep_len(cols, length(frac))
  }

  addTint <- function(col, tint) {
    rgb(t(col2rgb(col)) + tint*t((255-col2rgb(col))), maxColorValue=255)
  }
  addShade <- function(col, shade) {
    rgb(t(col2rgb(col)) * (1-shade), maxColorValue=255)
  }

  cols[frac <= 0] <- addTint(cols[frac <= 0], -frac[frac <= 0])
  cols[frac > 0]  <- addShade(cols[frac > 0], frac[frac > 0])
  cols
}

