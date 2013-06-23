class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name_en
      t.string :name_zh_CN
      t.string :address_en
      t.string :address_zh_CN
      t.string :zip_code
      t.string :tel
      t.string :tel2
      t.string :fax
      t.string :email
      t.string :website
      t.string :longitude
      t.string :latitude
      t.string :logo
      t.string :bank_name
      t.string :bank_number
      t.string :technical_support_qq
      t.string :online_consultation_qq

      t.timestamps
    end

    create_table :businesses_companies, id: false do |t|
      t.integer :business_id
      t.integer :company_id

      t.timestamps
    end

  end
end
