class CoursesController < ApplicationController 
    before_action :require_admin, except: [:index, :show] 

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
        @course = Course.new(params.require(:course).permit(:name, :number, :description, student_ids: []))
        @course.admin = Admin.first
        @course.save 
        redirect_to @course  
    end

    def edit 
        @course = Course.find(params[:id])
    end

    def update 
        if  @course.update(params.require(:course).permit(:name, :number, :description))
            flash[:message] = "Course Updated"
            redirect_to @course
        else    
            render 'edit'    
        end
    end
    def destroy  
            @course = Course.find(params[:id])
            @course.destroy 
            redirect_to @admin 
    end

    def add_course_to_student
        @course = Course.find(params[:course_id])
        helpers.current_student.courses << @course 
        redirect_to helpers.current_student

    end

    def authorized_admin
        redirect to root_path unless current_admin
    end

end