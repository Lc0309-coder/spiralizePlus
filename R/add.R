#' Addition rules in spiralizePlus
#'
#' spPlot(contain n spTracks)+spTrack=spPlot(contain n+1 spTracks),n>=0 <br>
#' spTrak(contain n spTrakGeoms)+spTrackGeom=spTrack(contain n+1 spTrackGeoms),n>=0 <br>
#'
#' @param e1 A object defined in spiralizePlus
#' @param e2 A object defined in spiralizePlus
#'
#' @return A object defined in spiralizePlus
#' @examples
#' NULL
#'
#' @name addition-rules
NULL

#' @rdname addition-rules
#' @export
#' @include initialize.R
#' @include track.R
setMethod(
  "+",
  signature = c(e1 = "spPlot", e2 = "spTrack"),
  definition = function(e1, e2) {
    e1@tracks = c(e1@tracks, e2)
    e1
  }
)

#' @rdname addition-rules
#' @export
#' @include track.R
#' @include track-geom.R
setMethod(
  "+",
  signature = c(e1 = "spTrack", e2 = "spTrackGeom"),
  definition = function(e1, e2) {
    e1@trackGeoms = c(e1@trackGeoms, e2)
    e1
  }
)