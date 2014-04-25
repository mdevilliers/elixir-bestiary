defmodule Geom do
	
	@moduledoc """
		Function for calculating geometric functions
	"""

	@vsn 0.1

	@doc """
		Calculates the area of a rectangle, triangle, ellipse
		All values default to 1
	"""

	@spec area(atom(), number(), number()) :: number()

	def area( :rectangle, x , y) do
		x * y
	end


	def area( :triangle, x , y) do
		(x * y) / 2.0
	end

	def area( :ellipse, x , y) do
		:math.pi() * x * y
	end
end