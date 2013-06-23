# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company_post do
    user { create :user }
    company {|record| record.company_post_category.company }
    company_post_category { create :company_post_category }
    title_en { Faker::Lorem.sentence }
    title_zh_CN { Faker::LoremCN.sentence }
    content_en { Faker::Lorem.paragraphs(20).join('.') }
    content_zh_CN { Faker::LoremCN.paragraphs(20).join('.') }
  end
end
