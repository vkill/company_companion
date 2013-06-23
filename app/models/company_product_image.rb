class CompanyProductImage < ActiveRecord::Base

  mount_uploader :image, ::CompanyProductImageUploader

  belongs_to :company_product
  belongs_to :product, class_name: 'CompanyProduct'


end
