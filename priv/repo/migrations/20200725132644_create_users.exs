defmodule Hyades.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :password_hash, :string
      add :customer_id, :string, default: ""
      add :github_token, :string, default: ""
      add :stripe_done, :boolean, default: false
      add :github_done, :boolean, default: false

      add :show_releases, :boolean, default: true
      add :show_releases_body, :boolean, default: true

      add :show_issues, :boolean, default: true
      add :show_issues_body, :boolean, default: false

      add :show_commits, :boolean, default: false
      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
