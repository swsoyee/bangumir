# Reference to:
# https://raw.githubusercontent.com/karthik/rdrop2/master/R/drop_auth.R

# environment to store credentials
.dstate <- new.env(parent = emptyenv())


#' Authentication for Bangumi.tv
#'
#' This function authenticates you into Bangumi. The documentation for the
#' \href{https://bangumi.github.io/api/}{Bangumi API}
#' provides more details including alternate methods if you desire to
#' reimplement your own.
#'
#' @param new_user Set to \code{TRUE} if you need to switch to a new user
#' account or just flush existing token. Default is \code{FALSE}.
#' @param key Your application key (ID). \code{bangumir} already comes with a
#' key/secret but you are welcome to swap out with our own. Since these keys are
#' shipped with the package, there is a small chance they could be voided if
#' someone abuses the key. If you plan to use this in production, or for an
#' internal tool, the recommended practice is to create a new application on
#' \href{https://bgm.tv/dev/app}{Bangumi} and use those keys for your purposes.
#' @param secret Your application secret. Like \code{key}, \code{bangumir} comes
#' with a secret but you are welcome to swap out with our own.
#' @param cache By default your credentials are locally cached in a file called
#' \code{.httr-oauth}. Set to \code{FALSE} if you need to authenticate
#' separately each time.
#' @param rdstoken File path to stored RDS token. In server environments where
#' interactive OAuth is not possible, a token can be created on a desktop client
#' and used in production. See examples.
#'
#' @return A Token2.0 object, invisibly
#'
#' @import httr
#' @references \href{https://bangumi.github.io/api/}{API documentation}
#' @export
#'
#' @examples
#' \dontrun{
#'
#' # To either read token from .httr-oauth in the working directory or open a
#' # web browser to authenticate (and cache a token)
#' bgm_auth()
#'
#' # If you want to overwrite an existing local token and switch to a new
#' # user, set new_user to TRUE.
#' bgm_auth(new_user = TRUE)
#'
#' # To store a token for re-use (more flexible than .httr-oauth), save the
#' # output of bgm_auth and save it to an RDS file
#' token <- bgm_auth()
#' saveRDS(token, "/path/to/tokenfile.RDS")
#'
#' # To use a stored token provide token location
#' bgm_auth(rdstoken = "/path/to/tokenfile.RDS")
#' }
bgm_auth <- function(new_user = FALSE,
                     key = "bgm2725b1fa2fea5582",
                     secret = "b84bdc8fcc3c68dd277a6b9650f33867",
                     cache = TRUE,
                     rdstoken = NA) {

  # check if token file exists & use it
  if (new_user == FALSE & !is.na(rdstoken)) {

    # read token or error
    if (file.exists(rdstoken)) {
      .dstate$token <- readRDS(rdstoken)
    } else {
      stop("Token file not found.")
    }

    # authenticate normally
  } else {

    # remove any cached token if new user
    if (new_user && file.exists(".httr-oauth")) {
      message("Removing old credentials...")
      file.remove(".httr-oauth")
    }

    # set bangumi oauth2 endpoints
    bangumi <- httr::oauth_endpoint(
      request = NULL,
      authorize = "authorize",
      access = "access_token",
      base_url = "https://bgm.tv/oauth"
    )

    # registered bangumi app's key & secret
    bangumi_app <- httr::oauth_app("bangumir", key, secret)

    # get the token
    bangumi_token <- httr::oauth2.0_token(bangumi, bangumi_app, cache = cache)

    # make sure we got a token
    if (!inherits(bangumi_token, "Token2.0")) {
      stop("Something went wrong, try again.")
    }

    # cache token in bangumir namespace
    .dstate$token <- bangumi_token
  }
}


#' Retrieve oauth2 token from bangumir-namespaced environment
#'
#' Retrieves a token if it is previously stored, otherwise prompts user to get
#' one.
#'
#' @keywords internal
bgm_get_token <- function() {
  if (!exists(".dstate") || is.null(.dstate$token)) {
    bgm_auth()
  } else {
    .dstate$token
  }
}
