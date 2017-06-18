defmodule Oceanex.Mixfile do
  use Mix.Project

  def project do
    [app: :oceanex,
     version: "0.2.3",
     elixir: ">= 1.3.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps(),
     docs: [extras: ["README.md"]]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :poison]]
  end

  # Dependencies can be Hex packages:
  #
  defp deps do
    [
      {:httpoison, "~> 0.11"},
      {:poison, "~> 3.1"},
      {:bang, "~> 0.1.0"},
      {:ex_doc, "~> 0.13.0", only: :dev}
    ]
  end

  defp description do
    """
    Digital Ocean API client.
    """
  end

  defp package do
    [name: :oceanex,
     files: ["lib", "mix.exs", "README.md"],
     maintainers: ["Mustafa Turan"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/mustafaturan/oceanex"}]
  end
end
