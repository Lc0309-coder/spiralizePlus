#' S4 class spTrackGeom
#'
#' Objectified representation of the R package spiralize's plotting functions and corresponding parameters at the track level.
#'
#' @slot func character. The name of the plot function in the R package spiralize
#' @slot params list. A **named** list that stores the parameters of the function called by the backend.
#'
#' @export
#'
#' @examples
#' NULL
setClass("spTrackGeom", slots = c(func = "character", params = "list"))

spPoints <- function(x = NULL,
                     y = NULL,
                     pch = 1,
                     size = unit(0.4,"char"),
                     gp = gpar()){
  name_args <-list(
    x = x,
    y = y,
    pch = pch,
    size = size,
    gp = gp
  )
  new("spTrackGeom", func = "spiral_points", params = c(name_args))
}
