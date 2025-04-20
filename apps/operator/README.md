# Operator

This app implements the core operator library for the Ember-to-Elixir port. It includes:
- LLMOperator (language model execution)
- MapOperator (functional mapping)
- SequenceOperator (chained execution)
- ParallelOperator (parallel execution)

Operators are the building blocks for agent workflows and orchestration.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `operator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:operator, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/operator>.

