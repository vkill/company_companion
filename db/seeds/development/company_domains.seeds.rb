# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

after "master_data", "development:common_master", "development:companies" do

  p "> create company_domains..."

  Company.first(5).each do |company|

    FactoryGirl.create :company_domain, company: company
    
  end

end