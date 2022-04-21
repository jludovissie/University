class ApplicationController < ActionController::Base
    def require_student 
        if !helpers.logged_in?
            flash[:notice] = "You must be logged in to access this page"
            redirect_to root_path
        end
    end
    def require_admin  
        if !helpers.admin_logged_in? 
            flash[:notice] = "You must be an admin to access this page"
            redirect_to root_path
        end
    end

    def require_super_admin 
        if (!helpers.admin_logged_in? && helpers.current_user.admin?) 
            flash[:notice] = "You must have a super administraitor account to access this page"
            redirect_to root_path
        end
    end
    
end
