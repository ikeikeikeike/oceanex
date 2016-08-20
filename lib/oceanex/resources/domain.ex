defmodule Oceanex.Resource.Domain do
  @moduledoc """
  DigitalOcean `Domain` resource api calls.
  """

  use Bang
  import Oceanex.Client

  @bang {[all: 0, all: 1, create: 1, destroy: 1, find: 1],
    {Oceanex.Client, :body!}}

  @doc """
  List all domain records.
  """
  def all(opts \\ %{}), do: get("/domains", opts)

  @doc """
  Create a domain record.

  ### Examples

      Oceanex.Resource.Domain.create(%{name: name, ip_address: ip_address})
  """
  def create(%{name: _, ip_address: _} = opts), do: post("/domains",
    opts)

  @doc """
  Get a specific domain record.
  """
  def find(domain_name), do: get("/domains/#{domain_name}")

  @doc """
  Delete a specific domain record.
  """
  def destroy(domain_name), do: delete("/domains/#{domain_name}")
end
