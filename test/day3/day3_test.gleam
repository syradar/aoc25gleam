import day3/day3

pub fn should_day3a_test() {
  let input = [
    "987654321111111",
    "811111111111119",
    "234234234234278",
    "818181911112111",
  ]

  let expected = "357"
  let result = day3.day3a(input)

  assert result == expected
}
