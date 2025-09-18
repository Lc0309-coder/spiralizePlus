#' S4 class spPlot
#'
#'
#' @slot initMode character. It can only be the following values: "initialize", "initialize_by_gcoor", "initialize_by_time".
#' @slot initParams list. A **named** list that stores the parameters of the function called by the backend. Based on the value of initMode, the backend function will be one of the following three:[spiralize::spiral_initialize], [spiralize::spiral_initialize_by_gcoor], [spiralize::spiral_initialize_by_time].
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

#' Object generator for S4 class spPlot
#'
#' Object [spPlot-class] calls one of the following functions based on the value of initMode:[spiralize::spiral_initialize],[spiralize::spiral_initialize_by_gcoor],[spiralize::spiral_initialize_by_time].<br>
#' The correct way to call it is as follows: <br>
#' `spPlot(initMode = 'initialize',clear = TRUE,xlim = c(0,1),start = 360,end = 360 *5,scale_by = c("angle","curve_length"),period = NULL,clockwise = FALSE,flip = c("none","vertical","horizontal","both"),reverse = FALSE,polar_lines = scale_by=="angle",polar_lines_by = 30,polar_lines_gp = gpar(col = "#808080"),padding = unit(5,"mm"),newpage = TRUE,vp_param = list())` <br> <br>
#' `spPlot(initMode = 'initialize_by_gcoor',clear = TRUE,xlim = NULL,scal_by = "curve_length",...)` <br> <br>
#' `spPlot(initMode = 'initialize_by_time',clear = TRUE,xlim = NULL,start = NULL,end = NULL,unit_on_axis = c("days","months","weeks","hours","mins","secs"),period = c("years","months","weeks","days","hours","mins"),normalize_year = FALSE,period_per_loop = 1,polar_lines_by = NULL,verbose = TRUE,...)` <br> <br>
#'
#' @param initMode It can only be the following values:"initialize", "initialize_by_gcoor", "initialize_by_time".
#' @param clear Whether to call [spiralize::spiral_clear] before drawing.
#' @inheritDotParams spiralize::spiral_initialize
#' @inheritDotParams spiralize::spiral_initialize_by_gcoor
#' @inheritDotParams spiralize::spiral_initialize_by_time
#' @returns Object [spPlot-class]
#'
#' @importFrom methods new
#' @export
#' @examples
#' NULL
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

#' Draw the figures described by spPlot
#'
#' @param object object of [spPlot-class]
#' @returns No return information
#'
#' @importMethodsFrom methods show
#'
#' @exportMethod show
#' @examples
#' NULL
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
