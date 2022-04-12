module ApplicationHelper
    def current_student
        User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in? 
        !!current_student
    end
end
