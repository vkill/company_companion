class CreateCompanyIntroductions < ActiveRecord::Migration
  def change
    create_table :company_introductions do |t|
      t.belongs_to :company, index: true
      t.text :introduction_en
      t.text :introduction_zh_CN

      t.timestamps
    end
  end
end
