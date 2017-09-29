class AddGithubToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :text, null: false
    add_column :users, :github_token, :text
  end
end
