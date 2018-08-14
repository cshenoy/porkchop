defmodule PorkchopWeb.Admin.SessionController do
  alias Porkchop.Administration
  use PorkchopWeb, :controller
  plug :set_layout

  def new(conn, _params) do
    conn
    |> render("new.html")
  end

  def create(conn, %{"session" => session_params}) do
    case Administration.get_admin_by_credentials(session_params) do
      :error ->
        conn
        |> put_flash(:error, "Invalid email/password combo")
        |> render("new.html")
      user ->
        path = get_session(conn, :intending_to_visit) || page_path(conn, :index)
        conn
        |> assign(:current_admin, user)
        |> put_session(:admin_id, user.id)
        |> configure_session(renew: true)
        |> put_flash(:info, "Login Success")
        |> redirect(to: path)
    end
  end

  defp set_layout(conn, _) do
    conn
    |> put_layout("admin_login.html")
  end
end