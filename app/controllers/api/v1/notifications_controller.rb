class Api::V1::NotificationsController < ApplicationController

  before_filter :ensure_auth_key_present

  def index
    render json: current_auth_user.notifications, each_serializer: NotificationSerializer
  end

  def update
    if notification.update_attributes(notification_params)
      render json: { updated: true }
    else
      render json: { errors: notification.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if notification.update_attributes(status: "deleted")
    else
    end
  end

  private

  def notification
    @notification ||= current_auth_user.notifications.where(id: params[:id]).first
  end

  def notification_params
    params.require(:notification).permit(
      :message, :status
    )
  end
end
