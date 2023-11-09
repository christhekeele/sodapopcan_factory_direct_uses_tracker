defmodule App.Factory do
  use Factory.Builder

  register App.Foo, as: :foo
  register App.Bar, as: :bar
end
