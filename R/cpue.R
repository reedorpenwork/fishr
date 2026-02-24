#' Calculate Catch Per unit effort
#'
#' @param catch numeric vector of catch
#' @param effort numeric vector of effort
#' @param gear_factor numeric adjustment for gear standard
#'
#' @returns numeric vector of CPUE values
#' @export
#'
#' @examples
#' cpue(100,10)
#' cpue(100, 10, gear_factor = .5)
cpue <- function(catch, effort, gear_factor = 1) {
  raw_cpue <- catch / effort

  raw_cpue * gear_factor
}
