defmodule TrieViewer do

	def make_demo() do
		numbers = create_dummy_numbers()
		trie = :btrie.new()

		numbers_as_tries = Enum.map numbers, fn(x) -> findtries(x) end
		flattened = List.flatten numbers_as_tries
		iterate_and_store_numbers(flattened, 0, trie)
	end

	defp iterate_and_store_numbers([], _, data) do
		data
	end

	defp iterate_and_store_numbers([h|t], count, data) do
		data1 = :btrie.append(h, count, data)
		iterate_and_store_numbers(t, count+1, data1)
	end

	defp create_dummy_numbers() do
		range = 1..5000
		Enum.reduce range, [], fn(x, acc) -> [:erlang.integer_to_binary( get_dummy_number(1382000000)) | acc] end
	end

	defp get_dummy_number(additional) do
		:random.uniform( 10000000 + additional)
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
