class StudentsController < ApplicationController 
    def index 
        @students = Student.all
    end

    def show 
        @student = Student.find(params[:id])
    end

    def new 
        @student = Student.new 
    end

    def create 
        @student = Student.new(student_params)
        @student.degree = helpers.current_student 
        if @student.save 
            flash[:notice] = "Thank you for creating your account #{@student.username},  next step is to apply! "
            redirect_to students_path
        else 
            render 'new'    
        end
    end
    
    def edit 
        @student = Student.find(params[:id])
    end

    def update 
       @student = Student.find(params[:id])

        if @student.update(student_params)
           flash[:notice] = "Your account information was successfully updated"
           redirect_to @student
        else  
           render 'new'     
        end
    end

    def destroy 
        # @student.destroy 
        # session[:user_id] = nil if @ == current_user
        # flash[:notice] = "Account and all associated articles successfully deleted"
        # redirect_to root_path
    end


    private 

    def student_params 
        params.require(:student).permit(:username, :email, :password)
    end
end