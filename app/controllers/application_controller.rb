class ApplicationController < ActionController::Base

  def initialize
    super ;
    @categories = Category.all
    # if params != nil
    # @user_id = params[:id]
    # end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
