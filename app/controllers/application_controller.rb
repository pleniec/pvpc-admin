class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  helper_method :breadcrumbs_for

  def breadcrumbs_for(action)
    []
  end
end
