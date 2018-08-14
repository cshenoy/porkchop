defmodule Porkchop.Library do
  alias Porkchop.Library.Post
  alias Porkchop.Repo
  import Ecto.Query, only: [limit: 2, order_by: 3]

  def get_post!(slug), do: Post |> Repo.get_by!(Post, slug: slug)

  def get_posts(limit) do
    Post
    |> order_by([p], desc: p.inserted_at)
    |> limit(^limit)
    |> Repo.all
  end

  def get_posts do
    Post
    |> Repo.all
  end
end