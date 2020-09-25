defmodule Bin2dec do
  def convert_binary_to_decimal(binary, mode) do
    array_of_digits = Integer.digits(binary)
    reversed_array_of_digits = Enum.reverse(array_of_digits)

    result =
      Enum.filter(reversed_array_of_digits, fn element ->
        element != 0 && element != 1
      end)

    if(not Enum.empty?(result)) do
      "This is not a binary"
    else
      if mode != 0 && mode != 1 do
        "Invalid mode"
      else
        if mode == 0 do
          convert_binary_to_decimal_iteratively(reversed_array_of_digits)
        else
          if mode == 1 do
            convert_binary_to_decimal_recursively(reversed_array_of_digits)
          end
        end
      end
    end
  end

  def convert_binary_to_decimal_iteratively(binary) do
    [_, decimal] =
      Enum.reduce(binary, [0, 0], fn element, acc ->
        [counter, sum] = acc

        new_counter = counter + 1
        new_sum = element * :math.pow(2, counter) + sum

        [new_counter, new_sum]
      end)

    decimal
  end

  @spec convert_binary_to_decimal_recursively(any) :: integer
  def convert_binary_to_decimal_recursively(binary) do
    decimal = recursive(binary, 0)
    floor(decimal)
  end

  def recursive(elements, counter) do
    if(Enum.count(elements) == 0) do
      0
    else
      [head | tail] = elements
      head * :math.pow(2, counter) + recursive(tail, counter + 1)
    end
  end
end
