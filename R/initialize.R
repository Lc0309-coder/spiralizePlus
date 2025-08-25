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

spPlot=function(initMode = 'initialize',
                clear=TRUE,
                ...){
  new(
    "spPlot",
    initMode = initMode,
    initParams = list(...),
    tracks = list(),
    clear = clear
  )
}
setMethod('show',signature = 'spPlot',definition = function(object){
  if (object@clear)
    spiral_clear()

  if (object@initMode == 'initialize'){
    do.call(spiral_initialize, object@initParams)
  }else if (object@initMode == 'initialize_by_gcoor'){
    do.call(spiral_initialize_by_gcoor, object@initParams)
  }else if (object@initMode == 'initialize_by_time'){
    do.call(spiral_initialize_by_time, object@initParams)
  }

  for (current_track in object@tracks){
    do.call(current_track@func, current_track@params)
    for (current_geom in current_track@trackGeoms){
      do.call(current_geom@func,current_geom@params)
    }
  }

  return(invisible(NULL))
})
