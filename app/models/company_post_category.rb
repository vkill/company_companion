class CompanyPostCategory < ActiveRecord::Base

  has_ancestry

  belongs_to :company
  has_many :posts, class_name: 'CompanyPost'

end
