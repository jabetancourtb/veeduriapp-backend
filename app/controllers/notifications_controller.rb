class NotificationsController < ApplicationController

    def index
        @notifications = Notification.order("updated_at DESC")
        
    end

end