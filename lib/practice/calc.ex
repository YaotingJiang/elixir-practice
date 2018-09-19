defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def calc(expr) do
    tuple = Code.eval_string(expr)
    elem(tuple, 0)
  end

  def factor(x) do
    # String.to_integer(x) == x
    factorHelper(x, 2, [])
  end

  defp factorHelper(num, factor, primes) do
    # String.to_integer(num) == num
    cond do
      num < factor -> primes
      rem(num, factor) == 0 -> [factor | factorHelper(div(num, factor), factor, primes)]
      true -> factorHelper(num, factor + 1, primes)
    end
  end
end
