import day2/day2

pub fn should_day2b_test() {
  let input = [
    "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124",
  ]

  let expected = "4174379265"
  let result = day2.day2b(input)

  assert result == expected
}

pub fn should_check_valid_product_id_test() {
  assert day2.is_invalid_product_id_a(1212) == True
  assert day2.is_invalid_product_id_a(1234) == False
  assert day2.is_invalid_product_id_a(1111) == True
  assert day2.is_invalid_product_id_a(1221) == False
}

pub fn should_generate_range_for_product_ids_2_test() {
  assert day2.generate_product_ids_a(0, 1) == []
  assert day2.generate_product_ids_a(5, 12) == [10, 11, 12]
  assert day2.generate_product_ids_a(95, 105) == [95, 96, 97, 98, 99]
  assert day2.generate_product_ids_a(995, 1005)
    == [1000, 1001, 1002, 1003, 1004, 1005]
}

pub fn should_parse_product_id_test() {
  let line = "10-20"
  let expected = Ok(#(10, 20))
  let result = day2.parse_product_id_range(line)

  assert result == expected
}

pub fn should_return_error_on_invalid_product_id_test() {
  let line = "10-XX"
  let expected = Error(Nil)
  let result = day2.parse_product_id_range(line)

  assert result == expected
}

pub fn should_return_error_on_incomplete_product_id_test() {
  let line = "10-20-30"
  let expected = Error(Nil)
  let result = day2.parse_product_id_range(line)

  assert result == expected
}
