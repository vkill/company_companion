# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company_product_image do
    company_product { create :company_product }
    status :pending

    location { "carrierwave" }
    image { generate :product_image }
    file_name nil
    file_size nil
    file_content_type nil
    bucket nil
    key nil
    upload_result nil
    upload_token_expires_in nil

    factory :company_product_image_with_carrierwave do
      location { "carrierwave" }
      image { generate :product_image }  
    end

    factory :company_product_image_with_qiniu do
      location { "qiniu" }
      image nil
      file_name "test.jpg"
      file_size 1024
      file_content_type "image/jpg"
      bucket 'company_companion_development'
      key {|record| "/company_products/%s/%s" % [record.company_product_id, record.file_name] }
      upload_result ""
      upload_token_expires_in 3600
    end

  end
end
