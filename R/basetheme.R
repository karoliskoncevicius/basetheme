#' Base Theme
#'
#' Sets themes for base plotting
#'
#' Function dispatches based on the type of first argument:\cr\cr
#' 1. No arguments - the current theme settings are returned.\cr
#' 2. NULL - all theme settings are removed.\cr
#' 3. list - assumed that list stores theme settings.\cr
#' 4. character - a theme with that name is used.\cr
#'
#' Further arguments can be provided as \code{parameter=value} pairs.
#' See examples.
#'
#' @param ... - a sequence of \code{parameter=value} pairs (see Details).
#'
#' @return a list of all theme settings (invisibly, unless no arguments were provided).
#'
#' @seealso \code{basetheme_default()}
#'
#' @examples
#'   basetheme(basetheme_minimal())
#'   plot(1)
#'   basetheme("dark")
#'   plot(1)
#'   basetheme("dark", rect.col="grey10")
#'   pairs(iris[,1:4])
#'   basetheme()
#'   basetheme(NULL)
#'   dev.off(); plot(1, 1)
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
      oldpars <- list()
      pars <- c(list(palette=basetheme_default()$palette), pars[-1])
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

  template <- basetheme_default()
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

