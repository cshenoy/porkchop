defmodule Porkchop.Admin.DashboardController do
  def show(conn, _params) do
    render conn, "show.html"
  end
end