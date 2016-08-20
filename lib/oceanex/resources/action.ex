defmodule Oceanex.Resource.Action do
  @moduledoc """
  DigitalOcean `Action` resource api calls.
  """

  use Bang
  import Oceanex.Client

  @bang {[all: 0, all: 1, find: 1], {Oceanex.Client, :body!}}

  @doc """
  List all actions
  """
  def all(opts \\ %{}), do: get("/actions", opts)

  @doc """
  Get a specific action.
  """
  def find(action_id), do: get("/actions/#{action_id}")
end
