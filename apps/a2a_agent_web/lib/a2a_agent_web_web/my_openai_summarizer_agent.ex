defmodule A2aAgentWebWeb.MyOpenAISummarizerAgent do
  @moduledoc """
  Agent that summarizes input text using OpenAI GPT-4o.
  Implements before_node/4 for orchestration integration.
  """
  @openai_url "https://api.openai.com/v1/chat/completions"
  @api_key System.get_env("OPENAI_API_KEY") || "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"

  @doc """
  Adds a summary to the input by calling OpenAI GPT-4o.
  """
  @spec before_node(any(), map(), module(), map()) :: map()
  def before_node(_node, input, _op, _acc) do
    prompt = "Summarize this customer feedback: #{input["text"]}"
    headers = [
      {"Authorization", "Bearer #{@api_key}"},
      {"Content-Type", "application/json"}
    ]
    body = %{
      model: "gpt-4o",
      messages: [%{role: "user", content: prompt}]
    } |> Jason.encode!()

    case HTTPoison.post(@openai_url, body, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: resp_body}} ->
        case Jason.decode(resp_body) do
          {:ok, %{"choices" => [%{"message" => %{"content" => summary}} | _]}} ->
            Map.put(input, "summary", summary)
          _ ->
            Map.put(input, "summary", "Could not parse OpenAI response")
        end
      _ ->
        Map.put(input, "summary", "Could not generate summary")
    end
  end

  @doc """
  Passes output through unchanged.
  """
  @spec after_node(any(), map(), module(), map()) :: map()
  def after_node(_node, output, _op, _acc), do: output
end
