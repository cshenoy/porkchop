defmodule PorkchopWeb.PageController do
  use PorkchopWeb, :controller
  alias Porkchop.Library

  def index(conn, _params) do
    posts = Library.get_posts(3)
    render conn, "index.html", posts: posts
  end
end
