class Team < ApplicationRecord
  has_many :team_members
  has_many :users, through: :team_members

  has_many :projects

  before_create :ensure_handle

  def ensure_handle
    self.handle = name.parameterize if handle.blank?
  end
end
