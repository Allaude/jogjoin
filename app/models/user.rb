class User < ApplicationRecord
  has_secure_password
  has_many :product
    
# => Basic password validation
  validates_length_of       :password, within: 8..20,allow_nil:true, allow_blank:false
  validates_confirmation_of :password, allow_nil:true, allow_blank:false

  before_validation {
    (self.email = self.email.to_s.downcase) && (self.name = self.name.to_s.downcase)
  }

# => Make sure email and name are present and email is unique
  validates_presence_of :email
  validates_presence_of :name
  validates_uniqueness_of :email

  def can_modify?(user_id)
    role == 'admin' || user_id.to_s == id.to_s
  end

  def is_admin?
    role == 'admin'
  end

  def is_merchant?
    role == 'merchant'
  end

end
