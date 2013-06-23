# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :company_name_en do |n|
    "company#{n}"
  end

  sequence :company_name_zh_CN do |n|
    "公司#{n}"
  end

  sequence :company_address_en do |n|
    "Room 103, Weining road 358 Lane 13, Changning District , Shanghai, China."
  end

  sequence :company_address_zh_CN do |n|
    "上海市长宁区威宁路358弄13号103室"
  end


  factory :company do
    name_en { generate :company_name_en }
    name_zh_CN { generate :company_name_zh_CN }
    address_en { generate :company_address_en }
    address_zh_CN { generate :company_address_zh_CN }
    zip_code { generate :zip_code }
    tel { generate :tel }
    tel2 { generate :tel }
    fax { generate :fax }
    email { generate :email }
    website { generate :url }
    longitude { generate :longitude }
    latitude { generate :latitude }
    logo { generate :logo }
    bank_name { generate :bank_name }
    bank_number { generate :bank_number }
    technical_support_qq { generate :qq}
    online_consultation_qq { generate :qq }

    after(:build) {|company| company.class.skip_callback(:create, :after, :create_has_one_association!) }
    factory :company_with_create_has_one_association do
      after(:create) {|company| company.send(:create_has_one_association!)}
    end

  end
end
