class AddCompanyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company_id, :integer
    add_column :users, :company_identity, :string
  end
end
