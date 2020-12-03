test_that("bgm_user_collection()", {
  expect_error(
    bgm_user_collection(),
    "The argument `username` should be a character and must be passed in."
  )
  expect_error(
    bgm_user_collection(username = "sai", ids = "1"),
    "Only accept numeric vector in `ids` argument."
  )
  expect_error(
    bgm_user_collection(username = "sai", cat = "error"),
    "'arg' should be one of \"watching\", \"all_watching\""
  )
  expect_type(bgm_user_collection(username = "sai"), "list")
})
