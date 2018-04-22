class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.text :name, null: false
      t.timestamps
    end

    create_table :team_members do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
    end

    add_reference :projects, :team, foreign_key: true
    drop_table :project_users
  end
end
