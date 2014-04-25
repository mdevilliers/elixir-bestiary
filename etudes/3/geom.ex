defmodule Geom do
	
	@moduledoc """
		Function for calculating geometric functions
	"""

	@vsn 0.1

	@doc """
		Calculates the area of a rectangle, triangle, ellipse
	"""

	@spec area(atom(), number(), number()) :: number()

	def area({type,x,y}) do
		area(type, x, y )
	end

	defp area( :rectangle, x , y) when x >= 0 and y >= 0 do
		x * y
	end


	defp area( :triangle, x , y) when x >= 0 and y >= 0 do
		(x * y) / 2.0
	end

	defp area( :ellipse, x , y) when x >= 0 and y >= 0 do
		:math.pi() * x * y
	end

	defp area( _,_,_ ) do
		0
	end
end