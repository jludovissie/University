class StudentsController < ApplicationController 
    before_action :require_student, only: [:edit, :update]
    
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
        # @student.degree = helpers.current_student 
        if @student.save 
            session[:student_id] = @student.id
            flash[:notice] = "Congratulations, #{@student.name}!  You have been accepted to Paducah Business School! "
            redirect_to @student
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
      
    end

    def degree_list
        @student = Student.find_by_id(params[:major])
     
    end

    def major_select 
        if helpers.current_student.update(degree_id: params[:major])
            flash[:success] = "Congratulations, you just selected a major!"
            redirect_to major_path
        else  
            flash[:notice] = "Did not work" 
            redirect_to root_path    
        end   
    end

   

    private 

    def student_params 
        params.require(:student).permit(:username, :email, :age, :name, :act_score, :gpa, :password, :degree_id)
    end
end    

