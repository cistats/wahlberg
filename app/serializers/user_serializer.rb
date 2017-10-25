class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :image, :github_synced_at
end
