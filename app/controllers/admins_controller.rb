class AdminsController < ApplicationController 
    before_action :require_admin, only: [:edit, :update, :delete]

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
            session[:admin_id] = @admin.id
            flash[:notice] = "Congratulations, #{@admin.username}!  You have created your account! "
           redirect_to @admin
        else
           render 'login/faculty'
        end
    end

    def edit 
        @admin = Admin.find(params[:id])
    end
    
    def update 
        @admin = Admin.find (params[:id])
        if @admin.update(params.require(:admin).permit(:username, :email, :password))
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
    
    def edit_attributes 
        @admin = Admin.find(params[:id])
    end

    def update_attributes 
        @admin = Admin.find(params[:id])
        if @admin.update(params.require(:admin).permit(:name, :phone, :address, :description))
            redirect_to @admin 
        else   
            flash[:notice] = "Something went wrong!"  
            redirect_to root_path  
        end
    end

    def admin_params 
        params.require(:admin).permit(:email, :password, :username)
    end
end