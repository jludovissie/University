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
        # @student.destroy 
        # session[:user_id] = nil if @ == current_user
        # flash[:notice] = "Account and all associated articles successfully deleted"
        # redirect_to root_path
    end

    def degree_list
        @student = Student.find_by_id(params[:major])
     
    end

    def major_select 
        if helpers.current_student.update(degree_id: params[:major])
            flash[:success] = "Congratulations, you just selected a major!"
            redirect_to helpers.current_student
        else  
            flash[:notice] = "Did not work" 
            redirect_to root_path    
        end
    end

    private 

    def student_params 
        params.require(:student).permit(:username, :email, :age, :name, :act_score, :gpa, :password)
    end
end    

