#' Numeric Vector to Color
#'
#' Returns interpolated colors for a specified numeric vector.
#'
#' This function interpolates a given set of colors to a numeric vector.
#' Main use case is in turning numbers into colors for plots,
#' especially when different ranges of \code{x} has to be colored differently.
#'
#' @param x numeric vector
#' @param ... colors to build palette from (defaults to jet colors)
#' @param min minimum range value (defaults to \code{min(x)})
#' @param max maximum range value (defaults to \code{max(x)})
#'
#' @return a vector of colors for each element in x.
#'
#' @examples
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg), pch=19, cex=2)
#'
#'   cols <- c("cornflowerblue", "orange")
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, cols), pch=19, cex=2)
#'
#'   plot(mtcars$hp, mtcars$mpg, col=num2col(mtcars$mpg, "green", "red"), pch=19, cex=2)
#'
#' @author Karolis Koncevičius
#' @export
num2col <- function(x, ..., xmin=min(x, na.rm=TRUE), xmax=max(x, na.rm=TRUE)) {
  cols <- c(...)
  if(length(cols) < 1) {
    cols <- c("blue", "#007FFF", "cyan", "#7FFF7F", "yellow", "#FF7F00", "red")
  }

  if(min(x, na.rm=TRUE) < xmin) stop('x has values lower than "xmin"')
  if(max(x, na.rm=TRUE) > xmax) stop('x has values higher than "xmax"')

  vals <- x - xmin
  vals <- vals / (xmax-xmin)

  ramp <- colorRamp(cols)
  rgb(ramp(vals), maxColorValue=255)
}

