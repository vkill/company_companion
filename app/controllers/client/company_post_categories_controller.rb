# coding: utf-8
class Client::CompanyPostCategoriesController < Client::BaseController

  include ::StandardResources
  self.responder = ::StandardResponder
  
  respond_to :html, only: [:index, :new, :create, :destroy]
  respond_to :json, only: [:update_column]

  private

  def accessible_attributes
    [:name_en, :name_zh_CN, :ancestry]
  end

end
