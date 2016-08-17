defmodule Oceanex.Resource.Droplet do
  @moduledoc """
  DigitalOcean `Droplet` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all droplet records.
  """
  def all(opts \\ %{}), do: get("/droplets", opts)
  def all!(opts \\ %{}), do: all(opts) |> body!

  @doc """
  Create a droplet, or multiple droplets.

  ### Examples

      Oceanex.Resource.Droplet.create(%{name: name, region: region, size: size, image: image})

      Oceanex.Resource.Droplet.create(%{names: names, region: region, size: size, image: image})
  """
  def create(%{name: _, region: _, size: _, image: _} = opts),
    do: post("/droplets", opts)
  def create(%{names: _, region: _, size: _, image: _} = opts),
    do: post("/droplets", opts)
  def create!(opts), do: create(opts) |> body!

  @doc """
  Get a specific droplet record.
  """
  def find(droplet_id), do: get("/droplets/#{droplet_id}")
  def find!(droplet_id), do: find(droplet_id) |> body!

  @doc """
  Delete a specific droplet.
  """
  def destroy(droplet_id), do: delete("/droplets/#{droplet_id}")
  def destroy!(droplet_id), do: destroy(droplet_id) |> body!

  @doc """
  Delete droplets by tag name.
  """
  def destroy_by_tag(tag_name), do: delete("/droplets", %{tag_name: tag_name})
  def destroy_by_tag!(tag_name), do: destroy_by_tag(tag_name) |> body!

  @doc """
  Get a specific droplet kernel records.
  """
  def kernels(droplet_id), do: get("/droplets/#{droplet_id}/kernels")
  def kernels!(droplet_id), do: kernels(droplet_id) |> body!

  @doc """
  Get a specific droplet snapshot records.
  """
  def snapshots(droplet_id), do: get("/droplets/#{droplet_id}/snapshots")
  def snapshots!(droplet_id), do: snapshots(droplet_id) |> body!

  @doc """
  Get a specific droplet backup records.
  """
  def backups(droplet_id), do: get("/droplets/#{droplet_id}/backups")
  def backups!(droplet_id), do: backups(droplet_id) |> body!

  @doc """
  Get a specific droplet action records.
  """
  def actions(droplet_id), do: get("/droplets/#{droplet_id}/actions")
  def actions!(droplet_id), do: actions(droplet_id) |> body!

  @doc """
  Get a specific droplet action records.
  """
  def action(droplet_id, action_id), do:
    get("/droplets/#{droplet_id}/actions/#{action_id}")
  def action!(droplet_id, action_id), do: action(droplet_id, action_id) |> body!

  @doc """
  Get a specific droplet neighbor records.
  """
  def neighbors(droplet_id), do: get("/droplets/#{droplet_id}/neighbors")
  def neighbors!(droplet_id), do: neighbors(droplet_id) |> body!

  @doc """
  Enable backups for a droplet.
  """
  def enable_backups(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "enable_backups"})
  def enable_backups!(droplet_id), do: enable_backups(droplet_id) |> body!

  @doc """
  Disable backups for a droplet.
  """
  def disable_backups(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "disable_backups"})
  def disable_backups!(droplet_id), do: disable_backups(droplet_id) |> body!

  @doc """
  Reboot a droplet.
  """
  def reboot(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "reboot"})
  def reboot!(droplet_id), do: reboot(droplet_id) |> body!

  @doc """
  Power Cycle a droplet.
  """
  def power_cycle(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "power_cycle"})
  def power_cycle!(droplet_id), do: power_cycle(droplet_id) |> body!

  @doc """
  Shutdown a droplet.
  """
  def shutdown(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "shutdown"})
  def shutdown!(droplet_id), do: shutdown(droplet_id) |> body!

  @doc """
  Power off a droplet.
  """
  def power_off(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "power_off"})
  def power_off!(droplet_id), do: power_off(droplet_id) |> body!

  @doc """
  Power on a droplet.
  """
  def power_on(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "power_on"})
  def power_on!(droplet_id), do: power_on(droplet_id) |> body!

  @doc """
  Restore a droplet.

  ### Examples

      Oceanex.Resource.Droplet.restore(droplet_id, %{image: image})
  """
  def restore(droplet_id, %{image: _} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type, "restore"))
  def restore!(droplet_id, opts), do: restore(droplet_id, opts) |> body!

  @doc """
  Password reset on a droplet.
  """
  def password_reset(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "password_reset"})
  def password_reset!(droplet_id), do: password_reset(droplet_id) |> body!

  @doc """
  Resize a droplet.

  ### Examples

      Oceanex.Resource.Droplet.resize(droplet_id, %{size: size})
  """
  def resize(droplet_id, %{size: _} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type, "resize"))
  def resize!(droplet_id, opts), do: resize(droplet_id, opts) |> body!

  @doc """
  Rebuild a droplet.

  ### Examples

      Oceanex.Resource.Droplet.rebuild(droplet_id, %{image: image})
  """
  def rebuild(droplet_id, %{image: _} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type, "rebuild"))
  def rebuild!(droplet_id, opts), do: rebuild(droplet_id, opts) |> body!

  @doc """
  Rename a droplet.

  ### Examples

      Oceanex.Resource.Droplet.rename(droplet_id, %{name: name})
  """
  def rename(droplet_id, %{name: _} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type, "rename"))
  def rename!(droplet_id, opts), do: rename(droplet_id, opts) |> body!

  @doc """
  Change kernel of a droplet.

  ### Examples

      Oceanex.Resource.Droplet.change_kernel(droplet_id, %{kernel: kernel})
  """
  def change_kernel(droplet_id, %{kernel: _} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type,
          "change_kernel"))
  def change_kernel!(droplet_id, opts), do:
    change_kernel(droplet_id, opts) |> body!

  @doc """
  Enable IPv6 on a droplet.
  """
  def enable_ipv6(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "enable_ipv6"})
  def enable_ipv6!(droplet_id), do: enable_ipv6(droplet_id) |> body!

  @doc """
  Enable private networking on a droplet.
  """
  def enable_private_networking(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type:
          "enable_private_networking"})
  def enable_private_networking!(droplet_id), do:
    enable_private_networking(droplet_id) |> body!

  @doc """
  Take snapshot of a droplet.

  ### Examples

      Oceanex.Resource.Droplet.snapshot(droplet_id, %{name: name})
  """
  def snapshot(droplet_id, %{name: _} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type,
          "snapshot"))
  def snapshot!(droplet_id, opts), do: snapshot(droplet_id, opts) |> body!

  @doc """
  Call actions on tagged droplets.

  ### Examples

      Oceanex.Resource.Droplet.actions_on_tagged(tag_name, %{type: type})
  """
  def actions_on_tagged(tag_name, %{type: _} = opts),
    do: post("/droplets/actions?tag_name=#{tag_name}", opts)
  def actions_on_tagged!(tag_name, opts), do:
    actions_on_tagged(tag_name, opts) |> body!
end
