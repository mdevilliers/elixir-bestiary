defmodule TrieViewer do

	def make_demo() do
		numbers = ["01382665872","01382665666", "01382665801", "07967642801"]
		trie = :btrie.new()

		numbers_as_tries = Enum.map numbers, fn(x) -> findtries(x) end
		flattened = List.flatten numbers_as_tries
		iterate_and_append_numbers(flattened, 0, trie)
	end

	defp iterate_and_append_numbers([], _, btrie) do
		btrie
	end
	defp iterate_and_append_numbers([h|t], count, btrie) do
		tr = :btrie.append(h, count, btrie)
		iterate_and_append_numbers(t, count+1, tr)
	end

	def findtries(str) do
		findtries(str, [])
	end

	defp findtries([],acc) do
		acc
	end

	defp findtries( str,acc) when byte_size(str) < 3 do
		findtries([], acc)
	end

	defp findtries(<< a:: [size(8), bitstring], b:: [size(8), bitstring], c:: [size(8), bitstring], t:: binary >>,acc) do
		trie = a <> b <> c
		findtries( b <> c <> t , [trie | acc] )
	end

end
