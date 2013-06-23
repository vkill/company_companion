class User < Identity

  has_many :company_products
  has_many :company_posts

  belongs_to :company

end
