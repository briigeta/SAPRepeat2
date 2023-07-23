# app/controllers/passwords_controller.rb
class PasswordsController < ApplicationController
    def index
      @passwords = Password.all
    end

    def destroy
      @password = Password.find(params[:id])
      @password.destroy
      redirect_to passwords_path, notice: 'Password was successfully deleted.'
    end

    def show
      @password = Password.find(params[:id])
    end
  
    def new
      @password = Password.new
    end
  
    def create
      @password = Password.new(password_params)
      if @password.save
        redirect_to @password, notice: 'Password entry was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @password = Password.find(params[:id])
    end
  
    def update
      @password = Password.find(params[:id])
      if @password.update(password_params)
        redirect_to @password, notice: 'Password entry was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @password = Password.find(params[:id])
      @password.destroy
      redirect_to passwords_url, notice: 'Password entry was successfully deleted.'
    end
  
    private
  
    def password_params
      params.require(:password).permit(:website, :username, :password)
    end
  end
  