# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :company_post_category_name do |n|
    "category#{n}"
  end

  factory :company_post_category do
    company { create :company }
    name_en { generate :company_post_category_name }
    name_zh_CN { generate :company_post_category_name }
    ancestry nil
  end
end
