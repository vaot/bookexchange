class AuthController < ApplicationController

  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect(@user)
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
    end
  end

end
