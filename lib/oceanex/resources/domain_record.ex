defmodule Oceanex.Resource.DomainRecord do
  @moduledoc """
  DigitalOcean `DomainRecord` resource api calls.
  """

  use Bang
  import Oceanex.Client

  @bang {[all: 1, all: 2, create: 2, destroy: 2, find: 2, update: 3],
   {Oceanex.Client, :body!}}

  @doc """
  Get a listing of all records configured for a domain.
  """
  def all(domain_name, opts \\ %{}),
    do: get("/domains/#{domain_name}/records", opts)

  @doc """
  Create a new record to a domain-record.

  ### Examples

      Oceanex.Resource.DomainRecord.create(domain_name, %{type: type, name: name, data: data,
      priority: priority, port: port, weight: weight})
  """
  def create(domain_name, %{type: _, name: _, data: _, priority: _, port: _, weight: _} = opts),
    do: post("/domains/#{domain_name}/records", opts)

  @doc """
  Get a specific domain-record record.
  """
  def find(domain_name, record_id),
    do: get("/domains/#{domain_name}/records/#{record_id}")

  @doc """
  Update a domain-record record.

  ### Examples

      Oceanex.Resource.DomainRecord.update(domain_name, record_id, %{type: type, name: name, data: data,
      priority: priority, port: port, weight: weight})
  """
  def update(domain_name, record_id, %{type: _, name: _, data: _, priority: _, port: _, weight: _} = opts),
    do: put("/domains/#{domain_name}/records/#{record_id}", opts)

  @doc """
  Delete a domain-record record.
  """
  def destroy(domain_name, record_id),
    do: delete("/domains/#{domain_name}/records/#{record_id}")
end
