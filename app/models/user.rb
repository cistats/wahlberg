class User < ApplicationRecord
  has_many :project_users
  has_many :projects, through: :project_users

  devise :rememberable, :omniauthable, omniauth_providers: [:github]

  def self.from_github(auth)
    create_with(
      username: auth.info.nickname,
      name: auth.info.name,
      email: auth.info.email,
      image: auth.info.image
    ).find_or_create_by!(github_uid: auth.uid)
     .tap { |u| u.update(github_token: auth.credentials.token) }
  end

  def github
    @github ||= Octokit::Client.new(access_token: github_token)
  end

  def repositories
    Rails.cache.fetch("github/repos/#{id}", expires_in: 1.hour) do
      github.repositories
    end
  end
end
