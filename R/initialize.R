#' S4 class spPlot
#'
#' @slot initMode character. It can only be the following values: "initialize", "initialize_by_gcoor", "initialize_by_time".
#' @slot initParams list. A **named** list that stores the parameters of the function called by the backend. Based on the value of initMode, the backend function will be one of the following four:[spiralize::spiral_initialize], [spiralize::spiral_initialize_by_gcoor], [spiralize::spiral_initialize_by_time].
#' @slot tracks list. A list where [spTrack-class] are stored.
#' @slot clear logical. Whether to call [spiralize::spiral_clear] before drawing.
#'
#' @export
#'
#' @examples
#' NULL
setClass(
  "spPlot",
  slots = c(
    initMode = "character",
    initParams = "list",
    tracks = "list",
    clear = "logical"
  )
)