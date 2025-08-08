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
