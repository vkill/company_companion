class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

  def query_params_elements
    [:q, :page, :per_page]
  end
  def query_params
    params.slice(*query_params_elements)
  end
  helper_method :query_params
  
end
