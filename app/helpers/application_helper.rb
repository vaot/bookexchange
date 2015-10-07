module ApplicationHelper
  def server_data
    data = {}

    if signed_in?
      data[:current_user] = current_user.slice(:id, :first_name, :last_name)

      data[:current_user].merge!(
        profile_picture: current_user.profile_picture.attachment.url(:large),
        auth_key: current_user.generate_or_last_active_auth_key.auth_key
      )
    end

    data.to_json
  end
end
