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

end