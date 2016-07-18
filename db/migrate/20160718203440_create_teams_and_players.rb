class CreateTeamsAndPlayers < ActiveRecord::Migration
  def change
    create_table(:teams) do |t|
      t.string(:name)
      t.timestamps()
    end

    create_table(:players) do |t|
      t.string(:name)
      t.integer(:team_id)
      t.timestamps()
    end
  end
end
