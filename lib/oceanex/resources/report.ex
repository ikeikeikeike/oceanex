defmodule Oceanex.Resource.Report do
  @moduledoc """
  DigitalOcean `Domain` resource api calls.
  """

  use Bang
  import Oceanex.Client

  @bang {[droplet_neighbors: 0, droplet_neighbors: 1], {Oceanex.Client, :body!}}

  @doc """
  List any droplets that are running on the same physical hardware.
  """
  def droplet_neighbors(opts \\ %{}), do: get("/reports/droplet_neighbors",
    opts)
end
