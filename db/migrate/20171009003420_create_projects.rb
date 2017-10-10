class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :team, foreign_key: true

      t.text :org, null: false
      t.text :repo, null: false
      t.integer :github_id, null: false

      t.timestamps

      t.index :github_id
      t.index [:org, :repo]
    end
  end
end
