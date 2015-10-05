module AuthSystem
  def ensure_auth_key_present
    if auth_key.blank?
      render_json_unauthorized
    end
  end

  def ensure_genuine_user
    if current_user.id != params[:book][:user_id]
      render_json_unauthorized
    end
  end

  def auth_key
    @auth_key ||= AuthKey.active.where(auth_key: request.headers['X-BookExchange-Auth-Key']).first
  end

  def current_user
    @current_user ||= auth_key.owner
  end

  private

  def render_json_unauthorized
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end
end
