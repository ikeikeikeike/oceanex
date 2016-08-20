defmodule Oceanex do
  @moduledoc """
  DigitalOcean API Client Implementation, covers all v2 api calls.

  ## Installation

  The package can be installed as:

    1. Add `oceanex` to your list of dependencies in `mix.exs`:

      ```elixir
      def deps do
        [{:oceanex, "~> 0.2.1"}]
      end
      ```

    2. Ensure `oceanex` is started before your application:

      ```elixir
      def application do
        [applications: [:oceanex]]
      end
      ```

    3. Add your configuration to your config/config.exs

      ```elixir
      config :oceanex,
        api_base_uri: "https://api.digitalocean.com/v2",
        access_token: System.get_env("DIGITALOCEAN_ACCESS_TOKEN") || "",
        decoder: :atoms # :atoms (not efficient), :string (suggested, most efficient)
      ```

  ## Usage

  If you need only body of api response, add ! end of methods. On the other hand
  if you need header, body and response then use normal functions without ! sign.

  ```elixir
  Oceanex.Resource.Account.info!

  Oceanex.Resource.Account.info
  ```
  """
end
