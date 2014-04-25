defmodule Powers do
	
	import Kernel, except: [raise: 2, raise: 3]
    
    @spec raise( number(), number()) :: number()
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

	@spec raise( number(), number(), number()) :: number()
	def raise(_, 0, acc) do
		acc
	end

	def raise(number, power, acc) do
		raise(number, power-1 , number * acc)
	end
end