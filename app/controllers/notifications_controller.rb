class NotificationsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_notification, except: [:index, :new, :create, :my_publications]

    def index
        #@notifications = Notification.order("updated_at DESC")
        @notifications = current_user.notification.order("updated_at DESC")
    end

    def show
    end

    private

    def set_notification
        @notification = Notification.find(params[:id])
    end

    def notification_params
       params.require(:notification).permit(:description, :state, :user_id, :publication_id, :project_id)
    end

end