import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub const max_position = 100

pub const starting_position = 50

pub fn day1a(lines: List(String)) -> String {
  lines
  |> list.filter_map(to_turns)
  |> list.fold(#(starting_position, 0), step_a)
  |> fn(acc) { acc.1 }
  |> int.to_string
}

pub fn day1b(lines: List(String)) -> String {
  lines
  |> list.filter_map(to_turns)
  |> list.fold(#(starting_position, 0), step_b)
  |> fn(acc) { acc.1 }
  |> int.to_string
}

fn to_turns(line: String) -> Result(Int, Nil) {
  use first <- result.try(string.first(line))
  use sign <- result.try(sign_from_direction(first))
  use number <- result.try(int.parse(string.drop_start(line, 1)))

  Ok(sign * number)
}

fn sign_from_direction(char: String) -> Result(Int, Nil) {
  case char {
    "L" -> Ok(-1)
    "R" -> Ok(1)
    _ -> Error(Nil)
  }
}

pub fn step_a(acc: #(Int, Int), cur: Int) -> #(Int, Int) {
  let #(position, passes) = acc

  let wrapped_position = wrap_position(position + cur)

  let new_passes =
    passes
    + case wrapped_position {
      0 -> 1
      _ -> 0
    }

  #(wrapped_position, new_passes)
}

pub fn step_b(acc: #(Int, Int), cur: Int) -> #(Int, Int) {
  let #(position, passes) = acc

  let times_pointing_at_zero =
    count_times_pointing_at_zero_and_full_rotations(position, cur)
  let new_passes = passes + times_pointing_at_zero

  let wrapped_position = wrap_position(position + cur)
  #(wrapped_position, new_passes)
}

pub fn wrap_position(position: Int) -> Int {
  { position % max_position + max_position } % max_position
}

pub fn count_times_pointing_at_zero_and_full_rotations(
  dial: Int,
  clicks_to_rotate: Int,
) -> Int {
  let is_positive = clicks_to_rotate >= 0
  let rest = case is_positive {
    True -> clicks_to_rotate - { max_position - dial }
    False -> clicks_to_rotate + dial
  }

  let full_rotations = int.absolute_value(rest) / max_position

  let has_rest = case is_positive {
    True -> rest >= 0
    False -> rest <= 0 && dial != 0
  }

  full_rotations
  + case has_rest {
    True -> 1
    False -> 0
  }
}
