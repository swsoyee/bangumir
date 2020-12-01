test_that("bgm_user_info args check", {
  expect_error(
    bgm_user_info(),
    "The argument `username` should be a vector and must be passed in."
  )
  expect_error(
    bgm_user_info(username = list()),
    "The argument `username` should be a vector and must be passed in."
  )
  expect_error(
    bgm_user_info(username = c()),
    "The argument `username` should be a vector and must be passed in."
  )
  expect_error(
    bgm_user_info(username = rep(x = "username", 11)),
    "You are fetch over than 10 users info in a short time,
         which is not recommended."
  )
})
