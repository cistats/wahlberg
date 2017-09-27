class Team < ApplicationRecord
  has_many :users

  def self.create_default(user)
    create(name: "#{user.name}'s Team")
  end
end
