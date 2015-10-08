module ApplicationHelper
  def server_data
    data = {}

    if signed_in?
      data[:current_user] = current_user.slice(:id, :first_name, :last_name)

      user_data = Hash.new.tap do |data|
        data[:auth_key] = current_user.generate_or_last_active_auth_key.auth_key

        if current_user.profile_picture.present?
          data[:profile_picture] = current_user.profile_picture.attachment.url(:large)
        end
      end

      data[:current_user].merge!(user_data)
    end

    data.to_json
  end
end
