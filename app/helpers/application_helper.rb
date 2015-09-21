module ApplicationHelper
  def server_data
    data =
      if signed_in?
        {
          id: current_user.id,
          first_name: current_user.first_name,
          last_name: current_user.last_name,
          profile_picture: current_user.profile_picture.attachment.url(:large),
          logged_in: true,
          auth_key: current_user.generate_or_last_active_auth_key.auth_key
        }
      else
        {
          logged_in: false
        }
      end
    data.to_json
  end
end
