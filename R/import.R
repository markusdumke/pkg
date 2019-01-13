#' Import package
#'
#' Alternative to library.
#'
#' @param .pkg Character scalar. Package name.
#' @param .load Logical scalar. Load package?
#' @param .install Logical scalar. Install package if not already installed?
#'
#' @return
#' @export
#' @import magrittr
#'
#' @examples
#' # import_pkg("lubridate")
#' # import_pkg("lubridate", .load = TRUE)
import_pkg <- function(.pkg, .load = FALSE, .install = FALSE) {
  # Input checks

  .pkg <- as.character(substitute(.pkg))

  # Check if package is installed
  all.installed.pkgs <- installed.packages(.libPaths()) %>% data.frame() %>% .[["Package"]]
  installed <- .pkg %in% all.installed.pkgs

  if (isTRUE(.install) && isFALSE(installed)) {
    install.packages(.pkg)
  }

  if (isFALSE(.install) && isFALSE(installed)) {
    stop(paste0("Package ", .pkg, " is not installed."))
  }

  # Load package
  if (isTRUE(.load)) {
    library(.pkg)
  }
}

#' Import functions from package
#'
#' Alternative to library.
#'
#' @inheritParams import::from
#'
#' @export
#' @seealso import_pkg
#'
#' @examples
#' # import_from(magrittr, "%>%")
#' # import_from(checkmate, assert_logical)
import_from <- function(.from, ...) {
  import::from(.from = .from, ...)
}
