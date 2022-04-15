module ApplicationHelper
    def current_student
      @current_student ||= Student.find(session[:student_id]) if session[:student_id]
    end

    def logged_in? 
        !!current_student
    end
end
