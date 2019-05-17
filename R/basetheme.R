#' Theme Control
#'
#' Sets and returns base plotting theme parameters.
#'
#' Function dispatches based on the type of first argument:\cr\cr
#' 1. No arguments - returns the list of the current theme settings.\cr
#' 2. NULL - all theme settings are removed.\cr
#' 3. list - assumed that list stores theme settings.\cr
#' 4. character - a theme with that name is used.\cr
#' 5. parameter=value pair - sets the setting for the specified parameter.\cr
#'
#' Further arguments can be provided as \code{parameter=value} pairs.
#' See examples.
#'
#' The list of theme parameters is always returned invisibly,
#' except when function is called with no arguments.
#'
#' The parameters set by this function will take presedence over \code{par()} parameters.
#'
#' @param ... - a sequence of \code{parameter=value} pairs (see Details).
#'
#' @return a list of all theme settings (invisibly, unless no arguments were provided).
#'
#' @examples
#'   # Set theme by parameters
#'   basetheme(pch=19, las=1, cex=2)
#'   plot(1, 1)
#'
#'   # Obtain list of theme parameters
#'   # for the current theme
#'   basetheme()
#'   # for a specific theme
#'   theme <- basetheme("brutal")
#'   theme
#'
#'   # Set theme by name
#'   basetheme("dark")
#'   plot(1)
#'
#'   # Reset theme
#'   basetheme(NULL)
#'
#'   # Set theme by list
#'   theme <- basetheme("clean")
#'   theme$rect.col <- "grey90"
#'   basetheme(theme)
#'   pairs(iris[,1:4], col=iris$Species)
#'
#' @author Karolis Koncevičius
#' @export
basetheme <- function(...) {

  if(nargs() == 0) {
    return(current_theme())
  }

  pars    <- list(...)
  oldpars <- current_theme()

  if(is.null(names(pars))) names(pars) <- rep("", length(pars))

  if(names(pars)[1] == "") {
    if(is.null(pars[[1]])) {
      grDevices::palette("default")
      oldpars <- list()
      pars <- pars[-1]
    } else if(is.list(pars[[1]])) {
      pars <- c(pars[[1]], pars[-1])
    } else if(is.character(pars[[1]])) {
      pars <- c(get_theme(pars[[1]]), pars[-1])
    }
  }

  if(any(names(pars) == "")) {
    warning("unnamed arguments were discarded")
    pars <- pars[names(pars) != ""]
  }

  if(any(duplicated(names(pars)))) {
    pars <- pars[!duplicated(names(pars), fromLast=TRUE)]
  }

  template <- get_theme("default")
  if(length(pars) > 0 & any(!names(pars) %in% names(template))) {
    warning("unsupported arguments were discarded")
    pars <- pars[names(pars) %in% names(template)]
  }


  pars <- c(oldpars[!names(oldpars) %in% names(pars)], pars)
  pars <- Filter(Negate(is.null), pars)

  hook <- getHook("before.plot.new")
  hook$par     <- setParFun(pars)
  hook$palette <- setPalFun(pars)
  setHook("before.plot.new", hook, "replace")
  hook <- getHook("plot.new")
  hook$rect <- setRecFun(pars)
  setHook("plot.new", hook, "replace")

  invisible(pars)
}

