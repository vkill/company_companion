# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :company_domain do
    company { create :company }
    domain { generate :domain }
    icp_record_no { "京ICP证000000号" }
  end
end
