class CompanyPost < ActiveRecord::Base

  belongs_to :user
  belongs_to :company
  belongs_to :company_post_category
  belongs_to :category, class_name: 'CompanyPostCategory'

end
