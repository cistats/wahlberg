class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # @param [User] user
  def self.sync_for_user(user)
    user.repositories.each do |repo|
      project = Project.create_with(
        org: repo.owner.login,
        repo: repo.name
      ).find_or_create_by(github_id: repo.id)

      project.users << user unless project.users.include?(user)
    end

    user.update(github_synced_at: Time.current)
  end
end
