defmodule Oceanex.Resource.Account do
  @moduledoc """
  DigitalOcean `Account` resource api calls.
  """

  use Bang
  import Oceanex.Client

  @bang {[info: 0], {Oceanex.Client, :body!}}

  @doc """
  Get user information
  """
  def info,
    do: get("/account")
end
