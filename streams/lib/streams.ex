defmodule Streams do
end

defmodule Gateway do
  use HTTPoison.Base

  @endpoint "https://api.thingful.net/"

  def endpoint do
    @endpoint
  end

  defp process_url(@endpoint <> url) do
    @endpoint <> url
  end

  defp process_url(url) do
    @endpoint <> url
  end

end

defmodule ResultStream do

  def new(url) do
    Stream.resource(
      fn -> fetch_page(url) end,
      &process_page/1,
      fn _ -> end
    )
  end

  defp fetch_page(url) do
    response = Gateway.get!(url)
    body = Poison.decode!(response.body)
    items = body["data"]
    next = body["links"]["next"]
    {[items], next}
  end

  defp process_page({nil, nil}) do
    {:halt, nil}
  end

  defp process_page({nil, next_page_url}) do
    next_page_url
    |> fetch_page
    |> process_page
  end

  defp process_page({items, next_page_url}) do
    {items, {nil, next_page_url}}
  end

end

defmodule Thingful do

    def query_by_keyword(keyword) do
        ResultStream.new( "/things?q=" <> keyword )
    end
end
