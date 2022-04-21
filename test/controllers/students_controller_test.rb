require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest 
    setup do 
        @student = Student.new(name:"Jordan")
    end

    test "should get index" do 
        get students_url 
        assert_response :success 
    end

    test "should get new" do 
        sign_in_admin 
        get new_student_url 
        assert_response :success 
    end
end