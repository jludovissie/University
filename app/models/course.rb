class Course < ApplicationRecord
    has_many :course_students
    has_many :students, through: :course_students
    belongs_to :admin

    validates :name, presence: true
    validates :number, presence: true 
end