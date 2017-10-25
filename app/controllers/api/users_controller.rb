module Api
  class UsersController < Base
    def show
      render json: current_user
    end

    def update
      current_user.update(user_params)
      render json: current_user
    end

    private

    def user_params
      params.permit(:name, :email, :image)
    end
  end
end
