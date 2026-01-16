library(rxtras)
context("String operation tests")

test_that("substrRight works as intended", {
    expect_equal(substrRight("abc", 1), "c")
    expect_equal(substrRight("abcd", 2), "cd")
    expect_equal(substrRight("abc", 3), "abc")
})
