test_that("bgm_user_collection()", {
  expect_error(
    bgm_user_collection(),
    "The argument `username` should be a character and must be passed in."
  )
  expect_error(
    bgm_user_collection(username = "sai", ids = "1"),
    "Only accept numeric vector in `ids` argument."
  )
  expect_type(bgm_user_collection(username = "sai"), "list")
})
