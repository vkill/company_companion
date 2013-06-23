class CompanyCertification < ActiveRecord::Base

  mount_uploader :image, ::CompanyCertificationUploader

  belongs_to :company

end
