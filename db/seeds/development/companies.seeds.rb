# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

after "master_data", "development:common_master" do

  p "> create company..."

  15.times do
    company = FactoryGirl.create :company

    FactoryGirl.create :user, company: company
  end


  company = FactoryGirl.create :company
  FactoryGirl.create :user, company: company, email: 'heyp@playab.net'

end