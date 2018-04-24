class AddAuthorizerToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :authorizer, polymorphic: true, index: true
  end
end
