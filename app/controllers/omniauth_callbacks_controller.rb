class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.save
      sign_in(@user)
    end
    redirect_to root_path
  end
end