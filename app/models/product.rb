class Product < ApplicationRecord
  
# => Association of Products.

  belongs_to  :category, optional: true 
  belongs_to  :user, optional: true 

# => Enable uploader on product params and call the photo_uploader.rb

  mount_uploader :photo, PhotoUploader

# => Params validation. :name, :price, :description, :stock, :photo

  validates_presence_of :name,        allow_nil: true, allow_blank: false
  validates_presence_of :price,       allow_nil: true, allow_blank: false
  validates_presence_of :description, allow_nil: true, allow_blank: true
  validates_presence_of :stock,       allow_nil: true, allow_blank: false
  validates_presence_of :photo,       allow_nil: true, allow_blank: false 

end
