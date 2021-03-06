# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :authorized
  helper_method :logged_in?
  helper_method :current_user

  add_flash_types :info, :error, :warning
  
  protected 
  def current_user
      if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
     # redirect_to '/welcome' unless logged_in?
  end
  
  private
  
  def record_not_found
      render plain: "404 Not Found", status: 404
  end
end
