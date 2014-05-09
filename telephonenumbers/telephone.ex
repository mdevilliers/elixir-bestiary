
defmodule Telephone do

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


