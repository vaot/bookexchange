class AuthController < ApplicationController

  def facebook
    # TO DO, If this fails, implement error handling.
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect(@user)
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
    end
  end

end
