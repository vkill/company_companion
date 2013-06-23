class CreateCompanyEmployees < ActiveRecord::Migration
  def change
    create_table :company_employees do |t|
      t.belongs_to :company, index: true
      t.string :name_en
      t.string :name_zh_CN
      t.string :phone
      t.string :tel
      t.string :fax
      t.string :email
      t.string :qq
      t.string :skype
      t.string :position_en
      t.string :position_zh_CN

      t.timestamps
    end
  end
end
