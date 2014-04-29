defmodule Experiment do        
	def dyn (str) do                                                         
		try do                                                                         Code.compile_string str 
		rescue                                                                     	e in CompileError -> e
		end
	end
end

# c = Experiment.dyn "defmodule A  do\n def a do\n5\nend\nend" 
# A.a
