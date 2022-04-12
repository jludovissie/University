class SessionsController < ApplicationController 
    def new 

    end

    def create 
        student = Student.find_by(email: params[:email])
        if student && student.authentication(params[:password])
           session[:student_id] = student.id 
           redirect_to student 
        else   
           render 'new'        
        end
    end

    def destroy 
        session[:student_id] = nil 
        redirect_to login_path 
    end

end