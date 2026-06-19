defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair,1)
  end

  def to_milliliter({:cup,_} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 240}
  end

  def to_milliliter({:fluid_ounce,_} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 30}
  end

  def to_milliliter({:teaspoon,_} = volume_pair), do: {:milliliter, get_volume(volume_pair) * 5}

  def to_milliliter({:tablespoon,_} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 15}
  end

  def to_milliliter({:milliliter,_} = volume_pair) do
    volume_pair
  end

  def from_milliliter(volume_pair, :milliliter = unit) do
    volume_pair
  end

  def from_milliliter(volume_pair, :cup = unit) do
    {:cup,get_volume(volume_pair) / 240}
  end

  def from_milliliter(volume_pair, :fluid_ounce = unit) do
    {:fluid_ounce,get_volume(volume_pair) / 30}
  end

  def from_milliliter(volume_pair, :teaspoon = unit) do
    {unit,get_volume(volume_pair) / 5}
  end

  def from_milliliter(volume_pair, :tablespoon = unit),do: {unit,get_volume(volume_pair) / 15}

  def convert(volume_pair, :cup = unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end

  def convert(volume_pair, :fluid_ounce = unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end

  def convert(volume_pair, :teaspoon = unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)

  def convert(volume_pair, :tablespoon = unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)

  def convert(volume_pair, :milliliter = unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)
  
end
