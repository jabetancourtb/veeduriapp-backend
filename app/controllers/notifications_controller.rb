class NotificationsController < ApplicationController

    def index
        @notifications = Notification.order("updated_at DESC")
    end

    # def create_notification(publication_id)
    #     @notification = Notification.create(description:"Un usuario comento la publicación publication_id", state:1, publication_id:publication_id, user_id:1)
    #     #puts publication_id
    #     if @notification.save
    #         puts "HOLAAAAAA"
    #     end
    # end

end