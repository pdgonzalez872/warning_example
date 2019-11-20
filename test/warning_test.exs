defmodule WarningTest do
  use ExUnit.Case
  doctest Warning

  test "greets the world" do
    params = %{id: "an_id"}
    assert params = %{id: "an_id"}
  end
end
