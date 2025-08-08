#' S4 class spTrack
#'
#' @slot func character. Normally it is "spiral_track".
#' @slot params list. A **named** list that stores the parameters of the function called by the backend.
#' @slot trackGeoms list. A list where [spTrackGeom-class] are stored.
#'
#' @export
#'
#' @examples
#' NULL
setClass("spTrack",
  slots = c(func = "character", params = "list", trackGeoms = "list")
)
