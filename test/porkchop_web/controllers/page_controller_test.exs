defmodule PorkchopWeb.PageControllerTest do
  use PorkchopWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Posts"
  end
end
