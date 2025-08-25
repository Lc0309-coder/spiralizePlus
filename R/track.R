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

spTrack = function(ylim = c(0,1),
                 height = 0.8,
                 background = TRUE,
                 background_gp = gpar(fill = "#EEEEEE"),
                 reverse_y = FALSE,
                 gradient = FALSE)
  {name_args = list(
    ylim = ylim,
    height = height,
    background = background,
    background_gp = background_gp,
    reverse_y = reverse_y,
    gradient = gradient
  )
  new(
    "spTrack",
    func = "spiral_track",
    params = c(name_args),
    trackGeoms = list()
  )
}
