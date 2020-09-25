defmodule Bin2decTest do
  use ExUnit.Case
  doctest Bin2dec

  test "should convert binary to decimal recursively" do
    assert Bin2dec.convert_binary_to_decimal(11101, 1) == 29
  end

  test "should convert binary to decimal iteratively" do
    assert Bin2dec.convert_binary_to_decimal(11101, 0) == 29
  end

  test "should show an error if not binary" do
    assert Bin2dec.convert_binary_to_decimal(112, 0) == "This is not a binary"
  end
end
