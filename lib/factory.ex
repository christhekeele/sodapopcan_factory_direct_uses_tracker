defmodule Factory do
  def build(module, fields \\ []) do
    struct!(module, fields)
  end
end
