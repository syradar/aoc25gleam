import gleam/bool
import gleam/int
import gleam/list
import gleam/result
import gleam/string
import utils

pub fn day2a(lines: List(String)) -> String {
  list.first(lines)
  |> result.map(string.split(_, on: ","))
  |> result.unwrap([])
  |> list.filter_map(parse_product_id_range)
  |> list.fold(0, sum_of_invalid_product_ids_in_range_a)
  |> int.to_string
}

pub fn sum_of_invalid_product_ids_in_range_a(
  acc: Int,
  range: #(Int, Int),
) -> Int {
  let #(min, max) = range
  generate_product_ids_a(min, max)
  |> list.filter(is_invalid_product_id_a)
  |> int.sum()
  |> int.add(acc)
}

pub fn is_invalid_product_id_a(product_id: Int) -> Bool {
  let string_id = int.to_string(product_id)
  let #(left, right) = utils.split_string_in_half(string_id)
  left == right
}

pub fn generate_product_ids_a(min: Int, max: Int) -> List(Int) {
  list.range(min, max)
  |> list.filter(fn(x) {
    case utils.digit_count(x) {
      Ok(count) -> int.is_even(count)
      Error(_) -> False
    }
  })
}

pub fn parse_product_id_range(line: String) -> Result(#(Int, Int), Nil) {
  let parts =
    line
    |> string.split("-")
    |> list.filter_map(int.parse)

  case parts {
    [min, max] -> Ok(#(min, max))
    _ -> Error(Nil)
  }
}
