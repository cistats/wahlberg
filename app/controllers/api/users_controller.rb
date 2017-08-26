module Api
  class UsersController < Base
    def index
      render json: users
    end

    def show
      render json: user
    end

    def update
      user.update(user_params)
      render json: user
    end

    private

    def users_scope
      current_user&.team&.users
    end

    def users
      @users ||= users_scope
    end

    def user
      @user ||= params[:id] ? users_scope&.find(params[:id]) : current_user
    end

    def user_params
      params.permit(:name, :email, :image)
    end
  end
end
