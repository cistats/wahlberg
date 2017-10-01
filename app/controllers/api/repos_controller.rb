module Api
  class ReposController < Base
    def index
      render json: repos
    end

    private

    def repos
      current_user&.github&.repositories
        &.group_by { |r| r.owner.login }
        &.transform_values do |repos|
          repos.map{ |r| r.to_h.slice(:id, :name, :description, :html_url, :private, :fork) }
        end
    end
  end
end
