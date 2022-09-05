class User < ApplicationRecord

    #For taking emails in lowercase format
    before_save { self.email = email.downcase }

    #one-to-many association
    has_many :articles

    validates :username, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 25 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    

    validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { maximum: 25 },
                    format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end