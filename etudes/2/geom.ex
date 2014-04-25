defmodule Geom do
	
	@moduledoc """
		Function for calculating geometric functions
	"""

	@vsn 0.1

	@doc """
		Calculates the area of a rectangle
		All values default to 1
	"""

	@spec area(number(), number()) :: number()

	def area(x \\ 1 ,y \\ 1) do
		x * y
	end
end