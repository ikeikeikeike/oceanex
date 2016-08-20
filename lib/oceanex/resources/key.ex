defmodule Oceanex.Resource.Key do
  @moduledoc """
  DigitalOcean `SSH Key` resource api calls.
  """

  use Bang
  import Oceanex.Client

  @bang {[all: 0, all: 1, create: 1, destroy: 1, find: 1, update: 2],
    {Oceanex.Client, :body!}}

  @doc """
  List all ssh key records.
  """
  def all(opts \\ %{}), do: get("/account/keys", opts)

  @doc """
  Create a ssh key record.
  """
  def create(%{name: _, public_key: _} = opts), do:
    post("/account/keys", opts)

  @doc """
  Get a specific ssh key record.
  """
  def find(key_id_or_key_finger_print), do:
    get("/account/keys/#{key_id_or_key_finger_print}")

  @doc """
  Update a specific ssh key record.

  ### Examples

      Oceanex.Resource.Key.update(key_id_or_key_finger_print, %{name: name})
  """
  def update(key_id_or_key_finger_print, %{name: _} = opts), do:
    put("/account/keys/#{key_id_or_key_finger_print}", opts)

  @doc """
  Delete a specific ssh key record.
  """
  def destroy(key_id_or_key_finger_print), do:
    delete("/account/keys/#{key_id_or_key_finger_print}")
end
