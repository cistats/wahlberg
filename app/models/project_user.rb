class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  def self.sync_for_user(user)
    return if user.github_synced_at > 1.minute.ago

    visible_projects = user.repositories.map do |repo|
      Project.create_with(
        org: repo.owner.login,
        repo: repo.name
      ).find_or_create_by(github_id: repo.id)
    end

    user_projects = user.projects

    user_projects.each do |project|
      user_projects.delete(project) unless visible_projects.include?(project)
    end

    visible_projects.each do |project|
      project.users << user unless user_projects.include?(project)
    end

    user.update(github_synced_at: Time.current)
  end
end
