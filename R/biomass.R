#' Calculate Biomass Index
#'
#'Calculates biomass index from CPUE and area swept
#'
#' @param cpue Numberic vector of CPUE values
#' @param area_swept Numeric vector of area swept (eg km^2)
#'
#' @returns returns numeric vector of biomass index values
#' @export
#'
#' @examples
#' salmon_cpue <- cpue(catch = 2, effort = 2)
#' biomass_index(salmon_cpue, 5)
biomass_index <- function(cpue, area_swept){
  cpue * area_swept
}
