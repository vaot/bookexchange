module AuthSystem
  def ensure_auth_key_present
    unless auth_key.present?
      render json: { error: "Not Authorized" }, status: :unauthorized
    end
  end

  def ensure_genuine_user
    unless current_auth_user.id == params[:book][:user_id]
      render json: { error: "Not Authorized" }, status: :unauthorized
    end
  end

  def auth_key
    @auth_key ||= AuthKey.active.where(auth_key: request.headers['X-BookExchange-Auth-Key']).first
  end

  def current_auth_user
    @current_auth_user ||= auth_key.owner
  end
end
