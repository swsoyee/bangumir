test_that("bgm_calendar()", {
  expect_s3_class(
    bgm_calendar(format = "table"),
    "data.table"
  )
})
