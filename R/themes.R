#' Theme Functions
#'
#' A list of available theme functions.
#'
#' For now the following themes are implemented:
#' 1. \code{basetheme_dark()}\cr
#' 2. \code{basetheme_default()}\cr
#' 3. \code{basetheme_minimal()}\cr
#' 4. \code{basetheme_void()}\cr
#'
#' The used parameters are:
#' 1) A subset of \code{par} parameters that are most universal to all plots.
#' 2) "palette" - a vector of colors that will be used when colors are specified by numbers.
#' 3) rect.* - \code{rect()} parameters that will be applied to the background of the plotting region.
#'
#' @return a list of parameters used by \code{basetheme} along with their settings.
#'
#' @seealso \code{basetheme}
#'
#' @examples
#'   basetheme_dark()
#'   basetheme_default()
#'   basetheme_minimal()
#'
#' @author Karolis Koncevičius
#' @name themes
#' @export
basetheme_default <- function() {
  palette <- c("black", "red", "green3", "blue", "cyan", "magenta", "yellow", "gray")
  list(fg           = "black",
       adj          = 0.5,
       ann          = TRUE,
       bg           = "transparent",
       bty          = "o",
       cex          = 1,
       cex.axis     = 1,
       cex.lab      = 1,
       cex.main     = 1.2,
       cex.sub      = 1,
       col          = "black",
       col.axis     = "black",
       col.lab      = "black",
       col.main     = "black",
       col.sub      = "black",
       family       = "",
       font         = 1,
       font.axis    = 1,
       font.lab     = 1,
       font.main    = 2,
       font.sub     = 1,
       lab          = c(5, 5, 7),
       las          = 0,
       lend         = "round",
       ljoin        = "round",
       lmitre       = 10,
       lty          = "solid",
       lwd          = 1,
       mgp          = c(3, 1, 0),
       pch          = 1,
       tck          = NA,
       xaxs         = "r",
       xaxt         = "s",
       xpd          = FALSE,
       yaxs         = "r",
       yaxt         = "s",
       rect.col     = NA,
       rect.density = numeric(),
       rect.angle   = 45,
       rect.lwd     = 1,
       rect.lty     = 1,
       rect.border  = NA,
       palette      = palette
       )
}

#' @rdname themes
#' @export
basetheme_dark <- function() {
  palette <- c("white", "red", "limegreen", "cornflowerblue", "orange")
  list(fg           = "white",
       adj          = 0.5,
       ann          = TRUE,
       bg           = "black",
       bty          = "o",
       cex          = 1,
       cex.axis     = 0.7,
       cex.lab      = 1,
       cex.main     = 1.2,
       cex.sub      = 1,
       col          = "white",
       col.axis     = "lightslategrey",
       col.lab      = "lightslategrey",
       col.main     = "white",
       col.sub      = "white",
       family       = "",
       font         = 1,
       font.axis    = 1,
       font.lab     = 1,
       font.main    = 2,
       font.sub     = 2,
       lab          = c(8,8,7),
       las          = 1,
       lend         = 0,
       ljoin        = 0,
       lmitre       = 10,
       lty          = 1,
       lwd          = 1,
       mgp          = c(2,0.7,0),
       pch          = 19,
       tck          = -0.01,
       xaxs         = "r",
       xaxt         = "s",
       xpd          = FALSE,
       yaxs         = "r",
       yaxt         = "s",
       rect.col     =  NA,
       rect.density =  numeric(),
       rect.angle   =  45,
       rect.lwd     =  1,
       rect.lty     =  1,
       rect.border  =  NA,
       palette      =  palette
       )
}

#' @rdname themes
#' @export
basetheme_minimal <- function() {
  palette <- c("black", "red", "limegreen", "cornflowerblue", "orange")
  list(fg           = "black",
       adj          = 0.5,
       ann          = TRUE,
       bg           = "white",
       bty          = "n",
       cex          = 1,
       cex.axis     = 0.8,
       cex.lab      = 1,
       cex.main     = 1.2,
       cex.sub      = 1,
       col          = "black",
       col.axis     = "black",
       col.lab      = "black",
       col.main     = "black",
       col.sub      = "black",
       family       = "",
       font         = 1,
       font.axis    = 1,
       font.lab     = 1,
       font.main    = 2,
       font.sub     = 2,
       lab          = c(5,5,7),
       las          = 1,
       lend         = 0,
       ljoin        = 0,
       lmitre       = 10,
       lty          = 1,
       lwd          = 1,
       mgp          = c(2,0.7,0),
       pch          = 19,
       tck          = -0.01,
       xaxs         = "r",
       xaxt         = "s",
       xpd          = FALSE,
       yaxs         = "r",
       yaxt         = "s",
       rect.col     =  NA,
       rect.density =  numeric(),
       rect.angle   =  45,
       rect.lwd     =  1,
       rect.lty     =  1,
       rect.border  =  NA,
       palette      =  palette
       )
}

#' @rdname themes
#' @export
basetheme_void <- function() {
  palette <- c("black", "red", "limegreen")
  list(fg           = "black",
       adj          = 0.5,
       ann          = FALSE,
       bg           = "white",
       bty          = "n",
       cex          = 0.8,
       cex.axis     = 0.8,
       cex.lab      = 1,
       cex.main     = 1.2,
       cex.sub      = 1,
       col          = "black",
       col.axis     = "black",
       col.lab      = "black",
       col.main     = "black",
       col.sub      = "black",
       family       = "",
       font         = 1,
       font.axis    = 1,
       font.lab     = 1,
       font.main    = 2,
       font.sub     = 2,
       lab          = c(5,5,7),
       las          = 1,
       lend         = 0,
       ljoin        = 0,
       lmitre       = 10,
       lty          = 1,
       lwd          = 1,
       mgp          = c(2,0.5,0),
       pch          = 19,
       tck          = -0.01,
       xaxs         = "i",
       xaxt         = "n",
       xpd          = FALSE,
       yaxs         = "i",
       yaxt         = "n",
       rect.col     =  NA,
       rect.density =  numeric(),
       rect.angle   =  45,
       rect.lwd     =  1,
       rect.lty     =  1,
       rect.border  =  NA,
       palette      =  palette
       )
}

