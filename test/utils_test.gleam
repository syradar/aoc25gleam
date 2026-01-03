import utils

// digit_count
pub fn should_count_digits_test() {
  assert utils.digit_count(12_345) == Ok(5)
  assert utils.digit_count(-12_345) == Ok(5)
}

// split_string_in_half
pub fn split_string_in_half_test() {
  let s = "12345678"
  let expected = #("1234", "5678")
  let result = utils.split_string_in_half(s)
  assert result == expected
}

pub fn split_odd_string_in_half_test() {
  let s = "123456789"
  let expected = #("1234", "56789")
  let result = utils.split_string_in_half(s)
  assert result == expected
}

pub fn split_empty_string_in_half_test() {
  let s = ""
  let expected = #("", "")
  let result = utils.split_string_in_half(s)
  assert result == expected
}
