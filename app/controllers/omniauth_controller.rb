class OmniauthController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable

  def github
    remember_me(user)
    sign_in_and_redirect(user, event: :authentication)
  end

  def failure
    render json: 1
  end

  private

  def user
    @user ||= User.from_github(auth_hash)
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
