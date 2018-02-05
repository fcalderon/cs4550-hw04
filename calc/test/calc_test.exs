defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  test "2 + 3 outputs 5" do
    assert Calc.eval("2 + 3") === 5
  end

  test "5 * 1 outputs 5" do
    assert Calc.eval("5 * 1") === 5
  end

  test "4 / 4 outputs 1" do
    assert Calc.eval("4 / 4") === 1
  end

  test "25 / 6 + (5 - 1) outputs 5" do
    assert Calc.eval("25 / 6 + (5 - 1)") === 5
  end

  test "1 + 3 * 3 + 1 outputs 11" do
    assert Calc.eval("1 + 3 * 3 + 1")  === 11
  end

  test "5 - (2 + 3 + 0) outputs 0" do
    assert Calc.eval("5 - (2 + 3 + 0)") == 0
  end

  test "((9 - 1) * (4 + 3)) outputs 56" do
    assert Calc.eval("((9 - 1) * (4 + 3))") === 56
  end
end
