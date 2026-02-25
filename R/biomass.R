#' Calculate Biomass Index
#'
#'Calculates biomass index from CPUE and area swept
#'
#' @param cpue Numberic vector of CPUE values
#' @param area_swept Numeric vector of area swept (eg km^2)
#' @param catch numerric
#' @param effort numeric
#' @param ... elip
#'
#' @returns returns numeric vector of biomass index values
#' @export
#'
#' @examples
#' salmon_cpue <- cpue(catch = 2, effort = 2)
#' biomass_index(salmon_cpue, 5)
biomass_index <- function(
    cpue = NULL,
    area_swept,
    catch = NULL,
    effort = NULL,
    ...
) {
  rlang::check_dots_used()

  if (is.null(cpue) && (!is.null(catch) && !is.null(effort))) {
    cpue <- cpue(catch, effort, ...)
  }

  if (is.null(cpue)) {
    stop("Must provide either 'cpue' or both 'catch' and 'effort'.")
  }

  validate_numeric_inputs(cpue = cpue, area_swept = area_swept)

  cpue * area_swept
}
