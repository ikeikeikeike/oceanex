defmodule Oceanex.Resource.Image do
  @moduledoc """
  DigitalOcean `Image` resource api calls.
  """

  use Bang
  import Oceanex.Client

  @bang {[all: 0, all: 1, destroy: 1, find: 1, update: 2],
    {Oceanex.Client, :body!}}

  @doc """
  List all image records.
  """
  def all(opts \\ %{}), do: get("/images", opts)

  @doc """
  Get a specific image record.
  """
  def find(image_id), do: get("/images/#{image_id}")

  @doc """
  Update a image record.

  ### Examples

      Oceanex.Resource.Image.update(image_id, %{name: name})
  """
  def update(image_id, %{name: _} = opts), do:
    put("/images/#{image_id}", opts)

  @doc """
  Delete a specific image record.
  """
  def destroy(image_id), do: delete("/images/#{image_id}")
end
