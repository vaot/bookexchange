class Api::V1::NotificationsController < Api::V1::ApiController

  before_filter :ensure_auth_key_present

  def index
    render json: current_auth_user.notifications, each_serializer: NotificationSerializer
  end

  def update
    if notification.update_attributes(notification_params)
      render_json_success
    else
      render_errors(notification)
    end
  end

  def destroy
    if notification.update_attributes(status: 'deleted')
      # TODO
    else
      # TODO
    end
  end

  private

  def notification
    @notification ||= current_auth_user.notifications.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(
      :message,
      :status
    )
  end
end
