defmodule Porkchop.Administration do
  alias Mango.Repo

  alias Mango.Administration.User

  def get_admin_by_email(email) do
    User |> Repo.get_by(email: email)
  end

  def get_admin_by_credentials(%{"email" => email, "password" => pass}) do
    customer = get_customer_by_email(email)
    cond do
      customer && Comeonin.Bcrypt.checkpw(pass, customer.password_hash) ->
        customer
      true ->
        :error
    end
  end
end