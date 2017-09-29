class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :image
end
