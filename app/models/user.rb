class User < ApplicationRecord
  has_secure_password
  has_many :contacts
                                          
                                          
  validates :email, uniqueness: true
  validates :first_name, uniqueness: true
  validates :last_name, uniqueness: true


end
