class SessionsController < ApplicationController 
    def new 

    end

    def create 
        student = Student.find_by(email: params[:session][:email].downcase)
        if student && student.authenticate(params[:session][:password])
            flash[:notice] = "Logged in successfully"
            session[:student_id] = student.id 
           redirect_to student 
        else   
           flash.now[:alert] = "There was something wrong with your login credentials" 
           render 'new'        
        end
    end

    def destroy 
        session[:student_id] = nil 
        flash[:notice] = "Logged Out"
        redirect_to root_path
    end

    def new_faculty 
        
    end

    def create_faculty 
        admin = Admin.find_by(email: params[:session][:email])
        if admin && admin.authenticate(params[:session][:email])
           flash[:notice] = "Logged in successfully"
           session[:admin_id] = admin.id
            redirect_to admin
        else    
            flash[:notice] = "Unsuccessfull login"
            render 'new'
        end
    end

    def destroy_faculty 
        session[:admin_id] = nil 
        flash[:notice] = "Logged Out"
        redirect_to root_path
    end

end