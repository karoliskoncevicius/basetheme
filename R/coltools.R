#' Numeric Vector to Color
#'
#' Returns interpolated colors for a specified numeric vector.
#'
#' This function interpolates a given set of colors to a numeric vector.
#' Main use case is in turning numbers into colors for plots,
#' especially when different ranges of \code{x} has to be colored differently.
#'
#' Color of NA values and values outside of specified interval can be set using
#' \code{NAcol} argument. Set this to NA to omit the display of such values.
#'
#' @param x numeric vector (factors are transformed to numeric)
#' @param ... colors to build palette from (defaults to jet colors)
#' @param NAcol color to be used for NA values (defaults to grey)
#' @param min lowest value of transformed vector (defaults to \code{min(x)})
#' @param max highest value of transformed vector (defaults to \code{max(x)})
#'
#' @return a vector of colors for each element in x.
#'
#' @examples
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg), pch=19, cex=2)
#'
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, min=20), pch=19, cex=2)
#'
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, min=20, NAcol=NA), pch=19, cex=2)
#'
#'   cols <- c("lightblue", "cornflowerblue", "orange", "red")
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, cols), pch=19, cex=2)
#'
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, "green", "red"), pch=19, cex=2)
#'
#' @author Karolis Koncevičius
#' @export
num2col <- function(x, pal, ref=range(x, na.rm=TRUE), NAcol) {
  if(is.factor(x)) x <- as.numeric(x)

  if(missing(pal)) {
    pal <- basetheme()$palette.numbers
  }
  if(is.null(pal)) {
    pal <- c("blue", "#007FFF", "cyan", "#7FFF7F", "yellow", "#FF7F00", "red")
  }

  if(missing(NAcol)) {
    NAcol <- basetheme()$palette.missing
  }
  if(is.null(NAcol)) {
    NAcol <- "#B9BBB6"
  }

  min <- min(ref, na.rm=TRUE)
  max <- max(ref, na.rm=TRUE)
  x[x < min | x > max] <- NA
  x <- x - min
  x <- x / (max-min)

  ramp <- colorRamp(pal)
  cols <- x
  cols[] <- NAcol
  cols[!is.na(x)] <- rgb(ramp(x[!is.na(x)]), maxColorValue=255)
  cols
}


#' Add Shade to Color
#'
#' Adds a selected ammount of shade or tint to a vector of colors.
#'
#' This function adds shades and tints to provided list of colors.
#' Shade or tint is decided depending on the sign of the \code{frac} argument:
#' positive values make colors darker and negative values lighten them.
#'
#' @param cols a vector of colors
#' @param frac a vector of shade fraction (between -1 and 1, defaults to 0)
#'
#' @return a vector of colors with added shades or tints.
#'
#' @examples
#'   barplot(1:11, col=colshade("red", frac=seq(-1,1,0.2)))
#'
#' @author Karolis Koncevičius
#' @export
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

