class Degree < ApplicationRecord 
    has_many :students
    has_many :classes
    
    validates :department, presence:true 
    validates :major, presence:true 
end