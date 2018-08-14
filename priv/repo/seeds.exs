# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
Porkchop.Repo.insert!(%Porkchop.Library.Post{
  title: "My First Post!",
  body: "This is my first post on Porkchop. Yum!",
  author: "Me",
  slug: "my-first-post"
})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
