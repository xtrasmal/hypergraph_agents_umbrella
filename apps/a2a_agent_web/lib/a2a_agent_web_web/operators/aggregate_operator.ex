defmodule A2aAgentWebWeb.Operators.AggregateOperator do
  @moduledoc """
  Aggregates a list of inputs using a reducer function and initial value.
  Ember port: AggregateOperator.

  ## Example
      iex> AggregateOperator.run([1, 2, 3], 0, fn acc, x -> acc + x end)
      6
  """

  @spec run([any()], any(), (any(), any() -> any())) :: any()
  @doc """
  Aggregates left-to-right: reducer is called as `reducer(acc, x)` for each `x` in `inputs`.
  If your reducer appears to produce reversed results, check the argument order in your reducer function.
  """
  def run(inputs, init, reducer) when is_list(inputs) and is_function(reducer, 2) do
    do_reduce(inputs, init, reducer)
  end

  defp do_reduce([], acc, _reducer), do: acc
  defp do_reduce([h | t], acc, reducer), do: do_reduce(t, reducer.(acc, h), reducer)
end
