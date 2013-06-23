class CompanyProduct < ActiveRecord::Base

  belongs_to :user
  belongs_to :company
  belongs_to :company_product_category
  belongs_to :category, class_name: 'CompanyProductCategory'
  has_many :images, class_name: 'CompanyProductImage'

end
