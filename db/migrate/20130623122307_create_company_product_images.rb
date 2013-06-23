class CreateCompanyProductImages < ActiveRecord::Migration
  def change
    create_table :company_product_images do |t|
      t.belongs_to :company_product, index: true
      t.string :location
      t.string :image
      t.string :status
      t.string :file_name
      t.integer :file_size
      t.string :file_content_type
      t.string :bucket
      t.string :key
      t.string :upload_token_expires_in
      t.string :upload_result

      t.timestamps
    end
  end
end
