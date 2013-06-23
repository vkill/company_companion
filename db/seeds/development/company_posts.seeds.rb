# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

after "master_data", "development:common_master", "development:companies", "development:company_post_categories" do

  p "> create company_posts..."

  Company.first(2).each do |company|

    user = company.super_manager

    company.post_categories.first(3).each do |company_post_category|

      20.times do 
        
        FactoryGirl.create :company_post, company: company, user: user, 
                                          company_post_category: company_post_category

      end

    end
  end

end
