defmodule Oceanex.Client do
  @moduledoc """
  Oceanex Client Module.
  """

  import HTTPoison, only: [request: 5]

  @doc """
  HTTP GET request to DigitalOcean API
  """
  def get(path, opts \\ ""),
    do: call(path, :get, opts)

  @doc """
  HTTP POST request to DigitalOcean API
  """
  def post(path, opts \\ ""),
    do: call(path, :post, opts)

  @doc """
  HTTP PUT request to DigitalOcean API
  """
  def put(path, opts \\ ""),
    do: call(path, :put, opts)

  @doc """
  HTTP DELETE request to DigitalOcean API
  """
  def delete(path, opts \\ ""),
    do: call(path, :delete, opts)

  @doc """
  Fetch only body from response
  """
  def body!({:ok, resp}),
    do: resp.body
  def body!({:error, err}),
    do: err

  defp call(path, method, opts) do
    opts = case opts do
      nil -> opts
      _ -> Poison.encode!(opts)
    end

    request(method, gen_endpoint(path), opts, headers, []) |> response
  end

  defp response({:ok, %HTTPoison.Response{body: nil} = resp}),
    do: {:ok, %{body: nil, headers: resp.headers, status: resp.status_code}}
  defp response({:ok, resp}) do
    {:ok, %{body: Poison.decode!(resp.body, keys:
      Application.get_env(:oceanex, :decoder)),
      headers: resp.headers, status: resp.status_code}}
  end
  defp response({:error, error}),
    do: {:error, error.reason}

  defp headers do
    %{"Content-Type" => "application/json", "User-Agent" => "oceanex",
      "Authorization" =>
      "Bearer #{Application.get_env(:oceanex, :access_token)}"}
  end

  defp gen_endpoint(path),
    do: Application.get_env(:oceanex, :api_base_uri) <> path
end
