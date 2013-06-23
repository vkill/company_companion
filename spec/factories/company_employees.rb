# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company_employee do
    company { create :company }
    name_en { Faker::Name.name }
    name_zh_CN { Faker::NameCN.name }
    phone { generate :phone }
    tel { generate :tel }
    fax { generate :fax }
    email { generate :email }
    qq { generate :qq }
    skype { generate :skype }
    position_en { "marketing manager" }
    position_zh_CN { "市场部经理" }
  end
end
