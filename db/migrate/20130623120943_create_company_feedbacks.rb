class CreateCompanyFeedbacks < ActiveRecord::Migration
  def change
    create_table :company_feedbacks do |t|
      t.belongs_to :company, index: true
      t.string :name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
