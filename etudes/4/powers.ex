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

    @spec nth_root( number(), number()) :: number()
	def nth_root(x,n) do
		nth_root(x,n,x/2.0)
	end

	defp nth_root(x, n, estimate) do
		f = raise( estimate , n) - x
		f_prime = n * raise(estimate , n - 1)

		next = estimate - f / f_prime
		change = abs(next - estimate)

		cond do
			change < 1.0e-8 -> next
			true -> 
				IO.puts("Current guess is #{estimate}")
				nth_root(x, n, next)
		end
	end

end