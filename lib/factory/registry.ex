defmodule Factory.Registry do
  defmacro register(module, opts \\ []) do
    alias = Keyword.fetch!(opts, :as)

    quote do
      Module.put_attribute(__MODULE__, :aliases, {unquote(alias), unquote(module)})
    end
  end
end
