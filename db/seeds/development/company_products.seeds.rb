# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

after "master_data", "development:common_master", "development:companies", "development:company_product_categories" do

  p "> create company_products..."

  Company.first(2).each do |company|

    user = company.super_manager

    company.product_categories.roots.each do |company_product_category_root|

      company_product_category_root.descendants.each do |company_product_category|

        rand(1..20).times do 
          
          product = FactoryGirl.create :company_product, company: company, user: user, 
                                            company_product_category: company_product_category

        
          rand(1..4).times do
            FactoryGirl.create :company_product_image, company_product: product
          end
          
        end

      end
    end
    
  end

end
