class Project < ApplicationRecord
  belongs_to :team
  belongs_to :authorizer, polymorphic: true
end
