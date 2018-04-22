module Api
  class TeamsController < Base
    def index
      render json: teams
    end

    def show
      render json: team
    end

    def create
      render json: teams.create(team_params)
    end

    def update
      team.update(team_params)
      render json: team
    end

    private

    def teams_scope
      current_user&.teams
    end

    def teams
      @teams ||= teams_scope.where(team_params)
    end

    def team
      @team ||= teams_scope&.find(params[:id])
    end

    def team_params
      params.permit(:name)
    end
  end
end
