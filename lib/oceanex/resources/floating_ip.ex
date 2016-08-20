defmodule Oceanex.Resource.FloatingIP do
  @moduledoc """
  DigitalOcean `FloatingIP` resource api calls.
  """

  use Bang
  import Oceanex.Client

  @bang {[action: 2, actions: 1, actions: 2, all: 0, all: 1, assign: 2,
   create: 1, destroy: 1, find: 1, unassign: 1, unassign: 2],
   {Oceanex.Client, :body!}}

  @doc """
  List all FloatingIP records.
  """
  def all(opts \\ %{}),
    do: get("/floating_ips", opts)

  @doc """
  Create a FloatingIP record.

  ### Examples

      Oceanex.Resource.FloatingIP.create(%{droplet_id: droplet_id})

      Oceanex.Resource.FloatingIP.create(%{region: region})
  """
  def create(%{droplet_id: _} = opts),
    do: post("/floating_ips", opts)
  def create(%{region: _} = opts),
    do: post("/floating_ips", opts)

  @doc """
  Get a specific FloatingIP record.
  """
  def find(floating_ip_addr),
    do: get("/floating_ips/#{floating_ip_addr}")

  @doc """
  Delete a specific FloatingIP record.
  """
  def destroy(floating_ip_addr),
    do: delete("/floating_ips/#{floating_ip_addr}")

  @doc """
  Assign a FloatingIP to a Droplet.

  ### Examples

      Oceanex.Resource.FloatingIP.assign(floating_ip_addr, %{droplet_id: droplet_id})
  """
  def assign(floating_ip_addr, %{droplet_id: _} = opts) do
    post("/floating_ips/#{floating_ip_addr}/actions",
      Map.put(opts, :type, "assign"))
  end

  @doc """
  Unassign a FloatingIP from a Droplet.
  """
  def unassign(floating_ip_addr, opts \\ %{}) do
    post("/floating_ips/#{floating_ip_addr}/actions",
      Map.put(opts, :type, "unassign"))
  end

  @doc """
  Get all action records that have been executed on a FloatingIP.
  """
  def actions(floating_ip_addr, opts \\ %{}),
    do: get("/floating_ips/#{floating_ip_addr}/actions", opts)

  @doc """
  Get a specific action record on a FloatingIP.
  """
  def action(floating_ip_addr, action_id),
    do: get("/floating_ips/#{floating_ip_addr}/actions/#{action_id}")
end
