# function to obtain the current theme settings
current_theme <- function() {
  hook1 <- getHook("before.plot.new")
  hook2 <- getHook("plot.new")

  theme <- list()
  if(is.function(hook1$par))
    theme <- c(theme, hook1$par(FALSE))
  if(is.function(hook1$palette))
    theme <- c(theme, hook1$palette(FALSE))
  if(is.function(hook2$rect))
    theme <- c(theme, hook2$rect(FALSE))

  theme
}

# function to get theme parameters by name
get_theme <- function(theme=NULL) {
  themes <- list_themes()
  if (theme %in% names(themes)) {
    themes[[theme]]()
  } else {
    stop("no such theme: ", theme, ".\nAvailable themes: ",
         paste(names(list_themes()), collapse=", ")
    )
  }
}

# function to set par settings
setParFun <- function(plist) {
  parList <- plist
  parList$palette <- NULL
  parList[grep("^rect\\.", names(parList))] <- NULL
  function(set=TRUE) {
    if(set)
      do.call(graphics::par, parList)
    else
      parList
  }
}

# function to set palette settings
setPalFun <- function(plist) {
  if(!is.null(plist$palette)) {
    function(set=TRUE) {
      if(set)
        grDevices::palette(value=plist$palette)
      else
        list(palette=plist$palette)
    }
  } else {
    NULL
  }
}

# function to set rect settings
setRecFun <- function(plist) {
  plist <- plist[grep("^rect\\.", names(plist))]
  if(length(plist) > 0) {
    function(set=TRUE) {
      if(set) {
        rlist <- list(xleft   = graphics::par("usr")[1], ybottom=graphics::par("usr")[3],
                      xright  = graphics::par("usr")[2], ytop=graphics::par("usr")[4],
                      col     = ifelse(is.null(plist$rect.col), NA, plist$rect.col),
                      density = ifelse(is.null(plist$rect.density), numeric(), plist$rect.density),
                      angle   = ifelse(is.null(plist$rect.angle), 35, plist$rect.angle),
                      lwd     = ifelse(is.null(plist$rect.lwd), 1, plist$rect.lwd),
                      lty     = ifelse(is.null(plist$rect.lty), 1, plist$rect.lty),
                      border  = ifelse(is.null(plist$rect.border), NA, plist$rect.border)
                      )
        do.call(graphics::rect, rlist)
      } else {
        plist
      }
    }
  } else {
    NULL
  }
}

