defmodule Slaks.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :body, :text, null: false
      add :user_id, references(:users, on_delete: :delete_all)
      add :room_id, references(:rooms, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:messages, [:user_id])
    create index(:messages, [:room_id])
  end
end
