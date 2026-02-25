#' Calculate Catch Per unit effort
#'
#' @param catch numeric vector of catch
#' @param effort numeric vector of effort
#' @param gear_factor numeric adjustment for gear standard
#' @param verbose
#' @param method
#'
#' @returns numeric vector of CPUE values
#' @export
#'
#' @examples
#' cpue(100,10)
#' cpue(100, 10, gear_factor = .5)
cpue <- function(
    catch,
    effort,
    gear_factor = 1,
    method = c("ratio", "log"),
    verbose = getOption("fishr.verbose", FALSE)
) {
  method <- match.arg(method)

  if (verbose) {
    message("Processing ", length(catch), " records using ", method, " method")
  }

  raw_cpue <- switch(
    method,
    ratio = catch / effort,
    log = log(catch / effort)
  )

  raw_cpue * gear_factor
}
