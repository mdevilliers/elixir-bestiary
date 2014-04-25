defmodule Powers do
	
	import Kernel, except: [raise: 2]

	def raise(_, 0) do
		1
	end

	def raise(number, 1) do
		number
	end

	def raise(number, power) when power > 1 do
		number * raise(number, power - 1)
	end

	def raise(number, power) when power < 0 do
		1.0 / raise(number, -power)
	end

end