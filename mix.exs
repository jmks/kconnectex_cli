defmodule KconnectexCLI.MixProject do
  use Mix.Project

  def project do
    [
      app: :kconnectex_cli,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        script: [
          include_executables_for: [:unix],
          steps: [:assemble, &Bakeware.assemble/1]
        ]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {KconnectexCLI, []}
    ]
  end

  defp deps do
    [
      {:bakeware, "~> 0.1.5"},
      {:kconnectex, git: "https://github.com/jmks/kconnectex.git", tag: "0.2.0"}
    ]
  end
end
