class NotificationsController < ApplicationController
  def new
  	@notification = Notification.new
  end

  def create
  	@notification = Notification.new notification_params
  	if @notification.save
  		redirect_to @notification, alert: "Notification created"
  	end
  end

  def show
  	@notification = Notification.find(params[:id])
  end

  def edit
  	@notification = Notification.find(params[:id])
  end

  def update
  	@notification = Notification.find(params[:id])
  	@notification.update(notification_params)
  	if @notification.save
  		redirect_to @notification, info: "Notification created"
  	end
  end

  def index
  	@notification = Notification.order("created_at").last
  	unless @notification.blank?	
  		redirect_to @notification
  	else
  		redirect_to url_for(:controller => :notifications, :action => :new)
  	end
  end

  private

  def notification_params
    params[:notification].permit(:message, :show)
  end

end
