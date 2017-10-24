module Api
  class ReposController < Base
    def index
      render json: repos
    end

    private

    def repos
      Rails.cache.fetch("github/repos/#{current_user.id}", expires_in: 1.hour) do
        current_user&.github&.repositories
          &.group_by { |r| r.owner.login }
          &.transform_values do |repos|
            repos.map{ |r| r.to_h.slice(:id, :name, :description, :html_url, :private, :fork) }
          end
      end
    end
  end
end
