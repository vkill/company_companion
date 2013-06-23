# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :business_name do |n|
    "business#{n}"
  end

  factory :business do
    name { generate :business_name }
    module_ids { [1] }
  end
end
