#' Numeric Vector to Color
#'
#' Returns interpolated colors for a specified numeric vector.
#'
#' This function interpolates a given set of colors to a numeric vector.
#' Main use case is in turning numbers into colors for plots,
#' especially when different ranges of \code{x} has to be colored differently.
#'
#' @param x numeric vector (factors are transformed to numeric)
#' @param ... colors to build palette from (defaults to jet colors)
#' @param NAcol color to be used for NA values (defaults to grey)
#' @param xrange original range of x values (defaults to \code{range(x)})
#'
#' @return a vector of colors for each element in x.
#'
#' @examples
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg), pch=19, cex=2)
#'
#'   cols <- c("lightblue", "cornflowerblue", "orange", "red")
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, cols), pch=19, cex=2)
#'
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, "green", "red"), pch=19, cex=2)
#'
#' @author Karolis Koncevičius
#' @export
num2col <- function(x, ..., NAcol="#B9BBB6", xrange=range(x, na.rm=TRUE)) {
  if(is.factor(x)) x <- as.numeric(x)
  if(length(xrange) != 2) stop('"xrange" must have 2 elements: min and max')
  if(min(x, na.rm=TRUE) < xrange[1]) stop('x has values lower than "xrange[1]"')
  if(max(x, na.rm=TRUE) > xrange[2]) stop('x has values higher than "xrange[2]"')

  pal <- c(...)
  if(length(pal) < 1) {
    pal <- c("blue", "#007FFF", "cyan", "#7FFF7F", "yellow", "#FF7F00", "red")
  }

  vals <- x - xrange[1]
  vals <- vals / (xrange[2]-xrange[1])

  ramp <- colorRamp(pal)
  cols <- vals
  cols[] <- NAcol
  cols[!is.na(vals)] <- rgb(ramp(vals[!is.na(vals)]), maxColorValue=255)
  cols
}

