class AdminsController < ApplicationController 
    def show 
        @admin = Admin.find(params[:id])
    end

    def index 
        @admins = Admin.all 
    end

    def new
        @admin = Admin.new     
    end

    def create 
        @admin = Admin.new(admin_params)
        if @admin.save 
           redirect_to @admin
        else
           render 'new'   
        end
    end

    def edit 
        @admin = Admin.find(params[:id])
    end
    
    def update 
        @admin = Admin.find (params[:id])
        
        if @admin.update(params.require(:admin).permit(:description, :address, :phone))
        flash[:message] = "Your Account has been updated!"
        redirect_to @admin 
        else   
        render 'edit'
        end 
    end

    def destroy 
        @admin = Admin.find(params[:id])
        flash[:message] = "#{@admin.name} was successfully deleted"
        @admin.destroy
        redirect_to root_path 
    end

    def admin_params 
        params.require(:admin).permit(:name, :username, :email, :password)
    end
end