defmodule Alfred.GiphMe do
  use Hedwig.Responder

  respond ~r/giph me (.*)/, %Hedwig.Message{matches: %{1 => search_term}} = msg do
    image_url =
      "https://api.giphy.com/v1/gifs/translate?" <> URI.encode_query(%{"api_key" => "dc6zaTOxFJmzC", "s" => search_term})
      |> HTTPoison.get()
      |> get_response()
    reply(msg, image_url)
  end

  def get_response({:ok, %HTTPoison.Response{body: body}}) do
    body
    |> Jason.decode!()
    |> get_in(["data", "images", "original", "url"])
  end

  def get_response({:error, _reason}) do
    "Sorry, something happend."
  end
end
