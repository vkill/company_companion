class CreateCompanyProducts < ActiveRecord::Migration
  def change
    create_table :company_products do |t|
      t.belongs_to :user, index: true
      t.belongs_to :company, index: true
      t.belongs_to :company_product_category, index: true
      t.string :name_en
      t.string :name_zh_CN
      t.text :introduction_en
      t.text :introduction_zh_CN

      t.timestamps
    end
  end
end
