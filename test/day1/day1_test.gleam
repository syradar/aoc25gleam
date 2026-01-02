import day1/day1
import gleam/int
import gleam/list

pub fn should_return_three_for_a_for_test_input_test() {
  let input = [
    "L68",
    "L30",
    "R48",
    "L5",
    "R60",
    "L55",
    "L1",
    "L99",
    "R14",
    "L82",
  ]
  let expected = "3"
  let result = day1.day1a(input)

  assert result == expected
}

pub fn should_return_three_for_b_for_test_input_test() {
  let input = [
    "L68",
    "L30",
    "R48",
    "L5",
    "R60",
    "L55",
    "L1",
    "L99",
    "R14",
    "L82",
  ]
  let expected = "6"
  let result = day1.day1b(input)

  assert result == expected
}

pub fn should_count_all_positive_passes_around_0_test() {
  let input = [50, 50, 50, 50]
  let expected = 2
  let state = day1.starting_position
  let result = { int.sum(input) + state } / day1.max_position

  assert result == expected
}

pub fn should_count_all_negative_passes_around_0_optimized_test() {
  let input = [
    #(day1.starting_position, -50, 1),
    #(day1.starting_position, -51, 1),
    #(day1.starting_position, -150, 2),
    #(day1.starting_position, 50, 1),
    #(day1.starting_position, 51, 1),
    #(day1.starting_position, 150, 2),
    #(82, -30, 0),
    #(0, -5, 0),
    #(0, 5, 0),
  ]

  list.each(input, fn(item) {
    let #(dial, clicks_to_rotate, expected) = item
    let result =
      day1.count_times_pointing_at_zero_and_full_rotations(
        dial,
        clicks_to_rotate,
      )
    assert result == expected
  })
}
