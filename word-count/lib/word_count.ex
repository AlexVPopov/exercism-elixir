defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    Regex.replace(~r/[^\w\s\d\-_]+/u, sentence, "")
    |> String.split(~r/\s+|_/)
    |> Enum.map(&String.downcase/1)
    |> Enum.reduce(%{}, fn word, stats ->
      Map.get_and_update(stats, word, fn current_count ->
        {current_count, (current_count || 0) + 1}
      end)
      |> elem(1)
    end)
  end
end
