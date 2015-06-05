
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

	defp findtries(<< a::binary-size(1), b::binary-size(1), c::binary-size(1), t::binary >> ,acc) do
		trie = a <> b <> c
		findtries( b <> c <> t , [trie | acc] )
	end

end

 # Telephone.findtries("123456789") # ["789", "678", "567", "456", "345", "234", "123"]

