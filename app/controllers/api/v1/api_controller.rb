class Api::V1::ApiController < ApplicationController

  before_filter :ensure_auth_key_present

  def render_json_success
    render json: { success: true }
  end

  def render_json_error(status = :unprocessable_entity)
    render json: { success: false }, status: status
  end

  def render_errors(object, status = :unprocessable_entity)
    render json: { errors: object.errors.full_messages }, status: status
  end

end
