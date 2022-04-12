class Student < ApplicationRecord 
    has_secure_password
    has_many :course_students 
    has_many :courses, through: :course_students
    belongs_to :degree

    validates :username, uniqueness: true, presence: true
    validates :email, presence: true, length:{maximum: 25}, format:  {with: URI::MailTo::EMAIL_REGEXP }
end