defmodule Stats do 

	@spec minimum([number]) :: number
	def minimum(list) do
		[h|t] = list
		minimum(t, h)
	end

	@spec minimum([number], number) :: number
	defp minimum([], lowest) do
		lowest
	end
	defp minimum([h|t], lowest) when h < lowest do
		minimum(t, h)
	end
	defp minimum([_|t], lowest)do
		minimum(t, lowest)
	end

	@spec maximum([number]) :: number
	def maximum(list) do
		[h|t] = list
		maximum(t,h)
	end

	@spec maximum([number], number) :: number
	defp maximum([], highest) do
		highest
	end
	defp maximum([h|t], highest) when h > highest do
		maximum(t, h)
	end
	defp maximum([_|t], highest)do
		maximum(t, highest)
	end

	@spec range([number]) :: [number]
	def range(list) do
		[minimum(list), maximum(list)] # not too efficient...
	end


end
