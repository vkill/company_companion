# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

after "master_data", "development:common_master", "development:companies" do

  p "> create company_employees..."

  Company.first(5).each do |company|

    5.times do 
      FactoryGirl.create :company_employee, company: company
    end
    
  end

end
