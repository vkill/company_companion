class CompanyProductCategory < ActiveRecord::Base

  has_ancestry

  belongs_to :company
  has_many :products, class_name: 'CompanyProduct'

end
