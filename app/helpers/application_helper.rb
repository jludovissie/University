module ApplicationHelper
  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in? 
    !!current_student
  end
    
  def current_admin 
    @current_admin || Admin.find(session[:admin_id]) if session[:admin_id]
  end
  
  def admin_logged_in?
    !!current_admin
  end
end  


