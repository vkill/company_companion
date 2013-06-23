# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

after "master_data", "development:common_master", "development:companies" do

  p "> create company_feedbacks..."

  Company.first(5).each do |company|

    5.times do 
      FactoryGirl.create :company_feedback, company: company
    end
    
  end

end
