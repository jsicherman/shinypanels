#' Title
#'
#' @param ...
#' @param title
#' @param id
#' @param body
#' @param footer
#' @param color
#' @param collapsed
#' @param can_collapse
#' @param width
#'
#' @return
#' @export
#'
#' @examples
panel <- function(..., title, id = NULL, footer = NULL, color = '#3295F5',
                  collapsed = F, can_collapse = T, width = NULL) {
  svgX <- function(color) {
    HTML(glue('<svg width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="{color}"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/></svg>'))
  }

  collapsed <- ifelse(collapsed, 'collapsed', '')

  if(!is.null(footer))
    footer <- div(class = 'panel-footer', footer)

  if(can_collapse)
    can_collapse <- tags$button(class = 'panel-header-dismiss',
                                svgX(color))
  else
    can_collapse <- NULL

  div(class = glue('panel {collapsed}'),
      style = glue('style="border-top: 1.5px solid {color}'),
      `data-width` = width,
      id = id,
      div(class = 'panel-header',
          id = paste0(id, '_head'),
          p(class = 'panel-header-title',
            style = glue('color: {color}'),
            title),
          can_collapse
      ),
      div(class = 'panel-body',
          id = paste0(id, '_body'),
          div(class = 'panel-content', ...)
      ),
      footer

  )
}
