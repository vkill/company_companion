class CreateCompanyCertifications < ActiveRecord::Migration
  def change
    create_table :company_certifications do |t|
      t.belongs_to :company, index: true
      t.string :name_en
      t.string :name_zh_CN
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
