class User < ApplicationRecord
  belongs_to :team, required: false

  devise :rememberable, :omniauthable, omniauth_providers: [:github]

  def self.from_github(auth)
    create_with(
      email: auth.info.email,
      name: auth.info.name,
      image: auth.info.image
    ).find_or_create_by!(github_uid: auth.uid)
  end
end
