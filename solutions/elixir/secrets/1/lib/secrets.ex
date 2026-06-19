defmodule Secrets do
  def secret_add(secret) do
    adder = fn inner ->
      secret + inner
    end
    adder
  end

  def secret_subtract(secret) do
    minus = fn inner ->
      inner - secret
    end
    minus
  end

  def secret_multiply(secret) do
    mult = fn inner ->
      inner * secret
    end
    mult
  end

  def secret_divide(secret) do
    div = &(&1/secret)
      |> floor()
    div
  end

  def secret_and(secret) do
    inner_and = &(Bitwise.band(&1,secret))
    inner_and
  end

  def secret_xor(secret) do
    inner_or = &(Bitwise.bxor(&1,secret))
    inner_or
  end

  def secret_combine(secret_function1, secret_function2) do
    inner_one = &(secret_function2.((secret_function1.(&1))))
    inner_one
  end
end
