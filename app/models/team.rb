class Team < ApplicationRecord
  has_many :users
  has_many :projects

  def self.create_default(user)
    create(name: "#{user.name}'s Team")
  end
end
