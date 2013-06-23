# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company_introduction do
    company { create :company }
    introduction_en { Faker::Lorem.paragraphs(20).join('.') }
    introduction_zh_CN { Faker::LoremCN.paragraphs(20).join('.') }
  end
end
