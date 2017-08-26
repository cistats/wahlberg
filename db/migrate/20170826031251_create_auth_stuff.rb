class CreateAuthStuff < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.text :name, null: false

      t.timestamps
    end

    create_table :users do |t|
      t.references :team

      t.text :name, null: false
      t.text :email, null: false
      t.text :image

      t.datetime :remember_created_at
      t.text :remember_token

      t.text :github_uid

      t.timestamps null: false

      t.index :email, unique: true
    end
  end
end
