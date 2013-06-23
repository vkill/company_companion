# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

after "master_data", "development:common_master", "development:companies" do

  p "> create company_post_categories..."

  Company.first(5).each do |company|

    5.times do 
      parent_category = FactoryGirl.create :company_post_category, company: company
    end
    
  end

end
