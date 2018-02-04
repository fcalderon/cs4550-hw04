defmodule Calc do
  @moduledoc """
  A command line calculator.
  """

  @doc """
  Calc.

  ## Examples

      iex> Calc.eval("1 + 3")
      4

  """
  def eval(expression) do
    spaceLessExpression = String.replace(expression, " ", "")

    5
  end
end
