class Business < ActiveRecord::Base

  has_and_belongs_to_many :companies, join_table: 'businesses_companies'

  serialize :module_ids, ::IdsArraySerialization.new

  def modules
    ::BusinessModule.find(module_ids)
  end

  def modules=(ids)
    self.module_ids = Array(ids).delete_if{|x| x == ''}
  end

end
