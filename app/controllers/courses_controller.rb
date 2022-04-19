class CoursesController < ApplicationController 
    def show 
        @course = Course.find(params[:id])
    end
    
    def index 
        @courses = Course.all 
    end

    def new 
        @course = Course.new()
    end

    def create 
        @course = Course.new(params.require(:course).permit(:name, :number, student_ids: []))
        @course.admin = Admin.first
        @course.save 
        redirect_to @course  
    end

    def edit 

    end

    def update 
        if  @course.update(params.require(:course).permit(:name, :number))
            flash[:message] = "Course Updated"
            redirect_to @course
        else    
            render 'edit'    
        end
    end

    def add_course_to_student
        @course = Course.find(params[:course_id])
        helpers.current_student.courses << @course 
        redirect_to helpers.current_student

    end

end