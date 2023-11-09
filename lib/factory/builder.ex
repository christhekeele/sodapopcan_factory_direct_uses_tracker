defmodule Factory.Builder do
  defmacro __using__(_ \\ []) do
    quote do
      Module.register_attribute(__MODULE__, :aliases, accumulate: true)
      import Factory.Registry, only: [register: 1, register: 2]
      @before_compile Factory.Builder
    end
  end

  defmacro __before_compile__(env) do
    def_build_default =
      quote do
        def build(alias), do: build(alias, [])
      end

    def_builds =
      for {alias, module} <- Module.get_attribute(env.module, :aliases) do
        quote do
          def build(unquote(alias), fields) do
            Factory.build(unquote(module), fields)
          end
        end
      end

    [def_build_default | def_builds]
  end
end
