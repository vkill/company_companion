class CreateCompanyPosts < ActiveRecord::Migration
  def change
    create_table :company_posts do |t|
      t.belongs_to :user, index: true
      t.belongs_to :company, index: true
      t.belongs_to :company_post_category, index: true
      t.string :title_en
      t.string :title_zh_CN
      t.text :content_en
      t.text :content_zh_CN

      t.timestamps
    end
  end
end
