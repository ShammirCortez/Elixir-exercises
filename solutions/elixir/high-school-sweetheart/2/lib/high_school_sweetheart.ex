defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.strip(name)
    |> String.first()
  end

  def initial(name) do
    first_letter(name)
    |> String.upcase() 
    |> Kernel.<> (".")
  end

  def initials(full_name) do
    #initial(full_name) <> " " <> initial(List.last(String.split(full_name," ")))

    full_name
    |> String.split(" ")
    |> List.last()
    |> initial()
    |> then(&(initial(full_name) <> " " <> &1))

  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end
