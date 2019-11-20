defmodule WarningTest do
  use ExUnit.Case
  doctest Warning

  @doc """
  ### Environment

  * Elixir & Erlang/OTP versions (elixir --version):
  Erlang/OTP 22 [erts-10.4.4] [source] [64-bit] [smp:12:12] [ds:12:12:10] [async-threads:1] [hipe]
  Interactive Elixir (1.9.1) - press Ctrl+C to exit (type h() ENTER for help)

  * Operating system:
  macOS - Mojave

  ### Current behavior
  In tests, it is nice to combine pattern matching with assertions. (Here is an example of the technique)[https://github.com/elixir-lang/elixir/blob/master/lib/elixir/test/elixir/agent_test.exs#L13].

  I was writing some tests and saw an interesting warning when doing something
  like the below. I thought I'd at least share it as an issue to document it:
  ```
  # in a test
  params = %{id: "an_id"}
  assert params = %{id: "an_id"}

  # warning
  warning: variable "params" is unused (if the variable is not meant to be used, prefix it with an underscore)
    test/warning_test.exs:20: WarningTest."test greets the world"/1
  ```

  The pin operator works to stop the warning, so that's a great solution and
  what we went with. But my question is: Should the compiler warn in this case?
  Should it use the message that it used?

  Sample repo: (here)[https://github.com/pdgonzalez872/warning_example/blob/master/test/warning_test.exs#L5]. Run `mix test` and you should see the warning.

  ### Expected behavior
  I'm not sure there is an expected behavior here. It may just have been a
  personal "aha" moment. I'd expect the warning not to show up since the
  variable is arguably being used, or, maybe a different warning message to
  nudge me towards a solution: "The pin operator may help you here"
  """
  test "greets the world" do
    params = %{id: "an_id"}
    assert params = %{id: "an_id"}
  end
end
