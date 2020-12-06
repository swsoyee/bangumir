test_that("bgm_subject()", {
  expect_error(
    bgm_subject(),
    "`id` should be passed in."
  )
  expect_type(bgm_subject(10380), "list")
})
