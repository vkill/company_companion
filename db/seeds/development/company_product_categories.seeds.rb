# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

after "master_data", "development:common_master", "development:companies" do

  p "> create company_product_categories..."

  Company.first(5).each do |company|

    5.times do 
      parent_category = FactoryGirl.create :company_product_category, company: company

      3.times do
        FactoryGirl.create :company_product_category, company: company,
                              parent: parent_category        
      end

    end
    
  end

end
