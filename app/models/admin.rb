class Admin < ApplicationRecord 
    has_secure_password
    
    has_many :courses, dependent: :destroy 
    validates :email, presence: true, length:{maximum: 25}, format:  {with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true 
    
    
end