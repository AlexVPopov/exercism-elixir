defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    mapping = %{:ones => ["I", "V", "X"],
                :tens => ["X", "L", "C"]
                :hundreds => ["C", "D", "M"]
                :thousands => ["M", "", ""]}

    Integer.digits(number)
  end

  def transform_ones(digit, first, second, third) do
    cond do
      digit == 0 -> ""
      digit <= 3 -> String.duplicate(first, digit)
      digit == 4 -> first <> second
      digit == 5 -> second
      digit < 9 -> second <> String.duplicate(first, digit - 5)
      digit == 9 -> first <> third
    end
  end
end
