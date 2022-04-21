require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new student form and create student" do
    get "/students/new"
    assert_response :success
      assert_difference "Student.count", 1 do 
      post students_path, params: {student: {name: "Jordan"}}
        assert_response :redirect 
    end
    follow_redirect! 
    assert_response :success 
    assert_match "Jordan", response.body 
  end
end
