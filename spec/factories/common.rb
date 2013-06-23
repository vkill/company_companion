# coding: utf-8
FactoryGirl.define do

  sequence :email do |n|
    Faker::Internet.email
  end

  sequence :password do |n|
    123456789
  end

  sequence :url do |n|
    "https://www.google.com/?"+ {q: Faker::Lorem::word}.to_query
  end

  sequence :domain do |n|
    "n#{n}.vkill.net"
  end

  sequence :tel do |n|
    "+86-28-88888888"
  end

  sequence :fax do |n|
    "+86-28-88888888"
  end

  sequence :phone do |n|
    "+86-13800138000"  
  end

  sequence :qq do |n|
    "123456789"
  end

  sequence :skype do |n|
    "skype"
  end


  sequence :zip_code do |n|
    Faker::Address.zip_code
  end

  sequence :longitude do |n|
    "121.29"
  end

  sequence :latitude do |n|
    "31.14"
  end

  sequence :logo do |n|
    open Dir[File.expand_path("../../support/company_logos/*.gif", __FILE__)].sample
  end

  sequence :bank_name do |n|
    "中国工商银行"
  end

  sequence :bank_number do |n|
    "622202000000000000"
  end

  sequence :product_image do |n|
    open Dir[File.expand_path("../../support/product_images/**/*.*", __FILE__)].sample
  end

end