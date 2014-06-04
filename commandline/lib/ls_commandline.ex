defmodule LsCommandLine do

	def main(args) do
		args |> parse_args |> process
	end

	def parse_args(args) do
		options = OptionParser.parse(args, switches: [help: :boolean],
                                  aliases: [h: :help])
		case options do
  			{ [ help: true], _}       -> :help
  			{[dir: true], [], []}     -> :help
  			{[dir: path], [], []}     -> {:dir, path}
  			_ -> :help
		end
	end

	def process({:dir, path}) do

		case File.ls(path) do
			{:ok, listing} ->
					displayFolderListing(listing)
			{:error, reason} ->
					IO.puts "Error : #{reason}" 						
		end
		
	end

	def process(:help) do
		IO.puts """
  			Usage:
    			ls --dir somePath

  			Options:
    			-h, [--help]      # Show this help message and quit.

  			Description:
    			ls Elixirfied
			"""
		System.halt(0)
	end

	defp displayFolderListing(listing) do
		listing |>
			Enum.map fn(file) -> IO.puts( "#{file}") end
	end

end