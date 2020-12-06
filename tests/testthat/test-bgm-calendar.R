test_that("bgm_calendar()", {
  mockRes <- bgm_calendar(format = "table")
  expect_type(mockRes, "list")
  expect_s3_class(mockRes$mon, "data.table")
})
