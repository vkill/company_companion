# coding: utf-8
class Client::BaseController < ApplicationController

  layout 'client'

  before_filter :set_resource, only: [:update_column]

  def update_column
    if Array(accessible_attributes).map(&:to_s).include?(params[:name].to_s)
      resource.update_attribute(params[:name], params[:value])
    else
      return render nothing: true, status: 400
    end
    respond_with *namespaces, resource, location: after_update_path
  end

  private
  
  def after_create_path
    polymorphic_path(namespaces + [collection_name], params: query_params)
  end

  def after_update_path
    polymorphic_path(namespaces + [resource], params: query_params)
  end

  def after_destroy_path
    polymorphic_path(namespaces + [collection_name], params: query_params)
  end

end
