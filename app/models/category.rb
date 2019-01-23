class Category < ApplicationRecord
  
# => This will make Category relational.  
  
  belongs_to :product, optional: true

# => Enable uploader on category params and call the banner_uploader.rb

  mount_uploader :banner, BannerUploader

# => Params validation. :name, :banner

  validates_presence_of   :name,    allow_nil: false, allow_blank: false
  validates_presence_of   :banner,  allow_nil: true,  allow_blank: false
  validates_uniqueness_of :name

end
