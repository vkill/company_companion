# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :user_email do |n|
    "user#{n}@test.com"
  end

  sequence :admin_user_email do |n|
    "admin#{n}@test.com"
  end

  factory :identity do
    name { Faker::Name.name }
    email { generate :email }
    password { generate :password }
    password_confirmation { generate :password }
  end


  factory :user, class: User, parent: :identity do
    email { generate :user_email }
    company { generate :company }
    company_identity :super_manager
  end


  factory :admin_user, class: AdminUser, parent: :identity do
    email {generate :admin_user_email}
  end

end
