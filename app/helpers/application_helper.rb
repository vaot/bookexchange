module ApplicationHelper
  def server_data
    data = {
      logged_in: false
    }

    if signed_in?
      data.merge!(current_auth_user.slice(:id, :first_name, :last_name))

      data.merge!(
        profile_picture: current_auth_user.profile_picture.attachment.url(:large),
        auth_key: current_auth_user.generate_or_last_active_auth_key.auth_key
      )

      data[:logged_in] = true
    end

    data.to_json
  end
end
