defmodule Streams do
end

defmodule Gateway do
  use HTTPoison.Base

  @endpoint "https://api.thingful.net/"

  def endpoint do
    @endpoint
  end

  defp process_url(url) do
    @endpoint <> url
  end

end

