class CreateCompanyProductCategories < ActiveRecord::Migration
  def change
    create_table :company_product_categories do |t|
      t.belongs_to :company, index: true
      t.string :name_en
      t.string :name_zh_CN
      t.string :ancestry

      t.timestamps
    end
  end
end
