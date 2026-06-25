defmodule HighScore do
  def new() do
    %{}
  end

  def add_player(scores, name) do
    Map.put(scores,name,0)
  end

  def add_player(scores, name, score) do
    Map.put(scores,name,score)
  end

  def remove_player(scores, name), do: Map.delete(scores,name)

  def reset_score(scores, name) do
    remove_player(scores,name)
    Map.put(scores,name,0)
  end

  def update_score(scores, name, score) do
    if(Map.get(scores,name)==nil)do
      Map.put(scores,name,score)
    else
      Map.put(scores,name,score + Map.get(scores,name))
    end
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
