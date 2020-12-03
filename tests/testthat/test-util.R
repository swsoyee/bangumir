test_that("bgm_user_info args check", {
  expect_error(
    check_username(),
    "The argument `username` should be a vector and must be passed in."
  )
  expect_error(
    check_username(username = list()),
    "The argument `username` should be a vector and must be passed in."
  )
  expect_error(
    check_username(username = c()),
    "The argument `username` should be a vector and must be passed in."
  )
  expect_error(
    check_username(username = rep(x = "username", 11)),
    "You are fetch over than 10 users info in a short time,
         which is not recommended."
  )
})

test_that(".check_username()", {
  expect_error(
    .check_username(),
    "The argument `username` should be a character and must be passed in."
  )
})
