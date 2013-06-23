# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :company_certification do |n|
    open Dir[File.expand_path("../../support/company_certifications/*.jpg", __FILE__)].sample
  end

  factory :company_certification do
    company { create :company }
    name_en { "Enterprise business license" }
    name_zh_CN { "企业营业执照" }
    image { generate :company_certification }
    description { Faker::Lorem.paragraph }
  end
end
