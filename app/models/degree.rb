class Degree < ApplicationRecord 
 scope :business_majors, -> {"Length(major) < 5"}   
 has_many :students   
end