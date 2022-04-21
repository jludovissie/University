require 'test_helper'

class StudentTest < ActiveSupport::TestCase 

    def setup 
        @student = Student.new(name: "Jordan")
    end

    test "student should be valid" do 
        assert @student.valid? 
    end

    test "name should be present" do 
        @student.name = ""
        assert_not @student.valid?
    end

    test "name should be unique" do 
        @student.save 
        @student2 = Student.new(name:"Jordan")
        assert_not @student2.valid? 
    end

end