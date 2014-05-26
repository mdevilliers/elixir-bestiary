defmodule AgentTest do

  def start_link do
    Agent.start_link(fn -> HashSet.new end, name: __MODULE__)
  end

  def list(agent) do
  	Agent.get(agent, fn(hash) -> Enum.map(hash, fn(term) -> IO.puts("#{term}") end) end )
  end

  def put(agent, term ) do
  	Agent.update(agent, fn(hash) -> HashSet.put(hash, term) end)
  end

  def delete(agent, term ) do
  	Agent.get_and_update(agent, &delete_if_exists(&1, term) )
  end

  defp delete_if_exists(hash, term) do
  		case HashSet.member?(hash, term) do
  			true -> {term, HashSet.delete(hash, term)}
  			false -> { :notfound, hash}
  		end
  end

  # { ok, agent}  = AgentTest.start_link()
  # AgentTest.put(agent, 1)
  # AgentTest.put(agent,"four")
  # AgentTest.list(agent)
  # AgentTest.delete(agent, 22) # :notfound
  # AgentTest.delete(agent, 1) # ok
end