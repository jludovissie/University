class DegreesController < ApplicationController 
    before_action :require_super_admin, only: [:edit, :update, :delete]
    def show 
        @degree = Degree.find(params[:id])
    end

    def index
        @degrees = Degree.all
    end
    
    def new 
        @degree = Degree.new
    end

    def create 
        @degree = Degree.new(department: params[:department], major: params[:major])
        @degree.save 
        redirect_to @degree 
    end
    def destroy 
        @degree = Degree.find(params[:id])
        flash[:message] = "#{@degree.major} was successfully deleted "
        @degree.destroy 
        redirect_to degrees_path 
    end
end