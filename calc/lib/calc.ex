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
    asArray = Enum.reduce(0..String.length(spaceLessExpression) - 1, [],
  fn(index, stack_acc) ->  stack_acc ++ [String.at(spaceLessExpression, index)] end)

    if (String.length(spaceLessExpression) === 3) do
      IO.puts "Evaluating simple"
      evalSimple(spaceLessExpression)
    else
      if hasParen(spaceLessExpression) do
        5
      else
        operands = extractOperands(spaceLessExpression)
        operators = extractOperators(asArray)
        extractOperators(asArray)
        Enum.reduce(0..length(operators) - 1, 0, fn(opIndex, res)
               -> res + operate(Enum.at(operators, opIndex),
                                Enum.at(operands, opIndex),
                                Enum.at(operands, opIndex + 1)) end)
      end
    end
  end

  defp hasParen(expression) do
    :binary.match(expression, "(") !== :nomatch
  end

  defp resolveParen(parenExp) do
    {openParenIndex, _} = String.at(parenExp, "(")
    {closingParenIndex, _} = String.at(parenExp, ")")

  end

  defp evalSimple(simpleExp) do
    operator = String.at(simpleExp, 1)
    IO.puts operator
    IO.puts String.at(simpleExp, 0)
    IO.puts String.at(simpleExp, 2)
    operate(operator, String.at(simpleExp, 0),
                      String.at(simpleExp, 2))
  end

  defp operate(operator, op1, op2) do
    {parsedOp1, _} = Integer.parse(op1)
    {parsedOp2, _} = Integer.parse(op2)

    cond do
      operator === "+" ->
        parsedOp1 + parsedOp2
      operator === "-" ->
        parsedOp1 - parsedOp2
      operator === "/" ->
        IO.puts "Division"
        IO.puts parsedOp1
        IO.puts parsedOp2
        parsedOp1 / parsedOp2
      operator === "*" ->
        parsedOp1 * parsedOp2
    end
  end

  defp extractOperands(expString) do
    String.split(expString, ~r/\+|\*|-|\//)
  end

  defp extractOperators(expArr) do
    Enum.filter(expArr, fn(x) -> not is_numeric(x) end)
  end

  # https://rosettacode.org/wiki/Determine_if_a_string_is_numeric#Elixir
  defp is_numeric(str) do
    try do
      case Integer.parse(str) do
        {_num, ""} -> true
        _          -> false
      end
    rescue
      e in FunctionClauseError -> false
    end
  end

end
