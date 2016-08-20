defmodule Oceanex.Resource.Region do
  @moduledoc """
  DigitalOcean `Region` resource api calls.
  """

  use Bang
  import Oceanex.Client

  @bang {[all: 0, all: 1], {Oceanex.Client, :body!}}

  @doc """
  List all region records.
  """
  def all(opts \\ %{}), do: get("/regions", opts)
end
