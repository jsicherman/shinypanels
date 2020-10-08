#' Title
#'
#' @return
#' @export
#'
#' @examples
useShinyPanels <- function() {
  list(includeScript(system.file('assets', 'js', 'shinypanels.js', package = 'shinypanels')),
       includeCSS(system.file('assets', 'css', 'shinypanels.css', package = 'shinypanels')))
}
