class ApplicationController < ActionController::Base
  # Note: Any before_action declared here must be skipped via active_admin.rb

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_categories

  private

  def set_categories
    @categories = Category.master
  end
end
