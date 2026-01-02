import utils

// digit_count
pub fn should_count_digits_test() {
  assert utils.digit_count(12_345) == Ok(5)
  assert utils.digit_count(-12_345) == Ok(5)
}
