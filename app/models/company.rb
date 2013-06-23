class Company < ActiveRecord::Base

  mount_uploader :logo, ::CompanyLogoUploader

  has_and_belongs_to_many :businesses, join_table: 'businesses_companies'

  has_one :introduction, class_name: 'CompanyIntroduction'
  has_many :users, class_name: 'User'
  has_one :super_manager, ->{where(company_identity: :super_manager)}, class_name: 'User'

  has_many :ceitifications, class_name: 'CompanyCertification'
  has_many :domains, class_name: 'CompanyDomain'
  has_many :employees, class_name: 'CompanyEmployee'
  has_many :feedbacks, class_name: 'CompanyFeedback'

  has_many :post_categories, class_name: 'CompanyPostCategory'
  has_many :posts, class_name: 'CompanyPost'
  
  has_many :product_categories, class_name: 'CompanyProductCategory'
  has_many :products, class_name: 'CompanyProduct'
  has_many :product_images, class_name: 'CompanyProductImage', through: :products
  

  after_create :create_has_one_association!

  private

  def create_has_one_association!
    create_introduction! unless introduction
  end

end
