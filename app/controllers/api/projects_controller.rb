module Api
  class ProjectsController < Base
    def index
      render json: projects
    end

    def show
      render json: project
    end

    def create
      render json: projects.create(project_params)
    end

    def update
      project.update(project_params)
      render json: project
    end

    def sync
      ProjectUser.sync_for_user(current_user)
      render json: { done: true }
    end

    private

    def projects_scope
      current_user&.projects
    end

    def projects
      @projects ||= projects_scope.where(project_params)
    end

    def project
      @project ||= projects_scope&.find(params[:id])
    end

    def project_params
      params.permit(:org, :repo, :github_id)
    end
  end
end
