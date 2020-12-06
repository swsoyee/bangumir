test_that("bgm_subject()", {
  expect_error(
    bgm_subject(),
    "`id` should be passed in."
  )

  expect_type(bgm_subject(10380), "list")
})

test_that("bgm_subject()", {
  expect_error(
    bgm_subject_ep(),
    "`id` should be passed in."
  )

  mockRes <- bgm_subject_ep(10380, "table")
  expect_type(mockRes, "list")
  expect_s3_class(mockRes$eps, "data.table")
})
