# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company_product do
    user { create :user }
    company {|record| record.company_product_category.company }
    company_product_category { create :company_product_category }
    name_en { Faker::Lorem.words(3).join(' ') }
    name_zh_CN { Faker::LoremCN.words(3).join(' ') }
    introduction_en { Faker::Lorem.paragraphs(20).join('.') }
    introduction_zh_CN { Faker::LoremCN.paragraphs(20).join('.') }
  end
end
