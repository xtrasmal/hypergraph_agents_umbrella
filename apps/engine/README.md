# Engine

This app implements the workflow execution engine (XCS) for Hypergraph Agents. It provides graph-based execution, topological sorting, and support for both parallel and sequential workflows.

- Executes agent workflows as directed acyclic graphs (DAGs)
- Supports dependency resolution and parallelization
- Core to orchestrating complex agentic tasks

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `engine` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:engine, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/engine>.

