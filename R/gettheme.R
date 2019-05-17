#' Get Theme
#'
#' Obtains a list of parameter-value pairs for a selected theme.
#'
#' The parameters used within each theme consists of:\cr
#' 1) A subset of \code{par} parameters that are most universal to all plots.\cr
#' 2) "palette" - a vector of colors that will be used when colors are specified by numbers.\cr
#' 3) rect.* - \code{rect()} parameters that will be applied to the background of the plotting region.\cr\cr
#'
#' Calling the \code{gettheme()} function with no arguments will return the settings of the current theme.
#' Calling the \code{gettheme()} function with a name of selected theme returns a list of all parameter values for that theme.
#'
#' @return a list of theme parameters used by \code{settheme()} along with their settings.
#'
#' @seealso \code{settheme()}
#'
#' @examples
#'   gettheme()
#'   gettheme("clean")
#'
#' @author Karolis Koncevičius
#' @export
gettheme <- function(theme=NULL) {
  themes <- list_themes()
  if(is.null(theme)) {
    current_theme()
  } else {
    if (theme %in% names(themes)) {
      themes[[theme]]()
    } else {
      stop("no such theme: ", theme, ".\nAvailable themes: ",
           paste(names(list_themes()), collapse=", ")
           )
    }
  }
}

