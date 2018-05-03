class AddHandleToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :handle, :text

    reversible do
      Team.all.each { |team| team.update(handle: team.name.underscore.gsub(/[^0-9a-z ]/i, '').gsub(' ', '-')) }
    end

    change_column :teams, :handle, :text, null: false
  end
end
