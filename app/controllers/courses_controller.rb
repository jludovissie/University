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
        @course = Course.new(name: params.require(:name).permit(:name, :number))
        @course.save 
        redirect_to @course  
    end

end