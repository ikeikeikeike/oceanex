defmodule Oceanex.Resource.Size do
  @moduledoc """
  DigitalOcean `Size` resource api calls.
  """

  use Bang
  import Oceanex.Client

  @bang {[all: 0, all: 1], {Oceanex.Client, :body!}}

  @doc """
  List all size records.
  """
  def all(opts \\ %{}),
    do: get("/sizes", opts)
end
