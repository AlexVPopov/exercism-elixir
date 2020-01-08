defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.split(~R/[^[:alnum:]\-]+/u, trim: true)
    |> Enum.reduce(%{}, fn word, stats -> Map.update(stats, word, 1, &(&1 + 1)) end)
  end
end
