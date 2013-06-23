class CreateCompanyDomains < ActiveRecord::Migration
  def change
    create_table :company_domains do |t|
      t.belongs_to :company, index: true
      t.string :domain
      t.string :icp_record_no

      t.timestamps
    end
  end
end
