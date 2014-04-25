defmodule Geom do
	
	@moduledoc """
		Function for calculating geometric functions
	"""

	@vsn 0.1

	@doc """
		Calculates the area of a rectangle, triangle, ellipse
	"""

   @spec area({atom(), number(), number()}) :: number()
	def area({shape,x,y}) when x >= 0 and y >= 0  do

		case shape do
			:rectangle ->
				x*y
			:triangle ->
				(x * y) / 2.0
			:ellipse ->
				:math.pi() * x * y
			_ ->
				0
		end
		
	end

end