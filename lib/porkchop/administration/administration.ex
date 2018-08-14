defmodule Porkchop.Administration do
  alias Porkchop.Repo
  alias Porkchop.Administration.User

  @doc """
  Gets a single user.
  Raises `Ecto.NoResultsError` if the User does not exist.
  ## Examples
      iex> get_user!(123)
      %User{}
      iex> get_user!(456)
      ** (Ecto.NoResultsError)
  """
  def get_user!(id), do: Repo.get!(User, id)

  def get_admin_by_email(email) do
    User |> Repo.get_by(email: email)
  end

  def get_admin_by_credentials(%{"email" => email, "password" => pass}) do
    customer = get_admin_by_email(email)
    cond do
      customer && Comeonin.Bcrypt.checkpw(pass, customer.password_hash) ->
        customer
      true ->
        :error
    end
  end
end