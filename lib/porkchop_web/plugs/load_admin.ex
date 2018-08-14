defmodule PorkchopWeb.Plugs.LoadAdmin do
  import Plug.Conn, only: [get_session: 2, assign: 3]
  alias Porkchop.Administration

  def init(_opts), do: nil

  def call(conn, _opts) do
    admin_id = get_session(conn, :admin_id)
    admin = admin_id && Administration.get_user!(admin_id)
    assign(conn, :current_admin, admin)
  end
end