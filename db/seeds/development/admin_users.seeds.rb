# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

after "master_data" do

  p "> create admin_users..."

  15.times do
    FactoryGirl.create :admin_user
  end

  FactoryGirl.create :admin_user, email: "122755990@qq.com"
  
end