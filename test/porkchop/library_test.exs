defmodule Porkchop.LibraryTest do
  use Porkchop.DataCase

  alias Porkchop.{Library, Repo}
  alias Porkchop.Library.Post

  setup do
    Repo.insert %Post{
      title: "Post #1",
      author: "Chetan Shenoy",
      body: "Some body",
      slug: "post-1",
      post_date: ~D[2018-08-08]
    }
    Repo.insert %Post{
      title: "Post #2",
      author: "Not Chetan Shenoy",
      body: "Some other body",
      slug: "post-2",
      post_date: ~D[2018-08-09]
    }
    :ok
  end

  test "get_posts" do
    [p1 = %Post{}, p2 = %Post{}] = Library.get_posts

    assert p1.title == "Post #1"
    assert p2.title == "Post #2"
  end
end