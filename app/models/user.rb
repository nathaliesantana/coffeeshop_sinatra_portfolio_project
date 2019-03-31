class User < ActiveRecord::Base
  has_many :custom_beverages
  has_secure_password

end
