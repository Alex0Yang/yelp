class User < ActiveRecord::Base
  validates_presence_of :full_name, :email, :password
  has_secure_password validations: false
  validates_uniqueness_of :email
end
