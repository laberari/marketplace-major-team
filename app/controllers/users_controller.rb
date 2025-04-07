class UsersController < ApplicationController
    # Acción para mostrar el formulario de registro
    def new
      @user = User.new
    end
  
    def show
      @user = User.find(params[:id])
    end

    # Acción para crear un nuevo usuario
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path, notice: "¡Usuario creado exitosamente!"
      else
        render :new
      end
    end
  
    private
  
    # Método para permitir los parámetros seguros
    def user_params
      params.require(:user).permit(:name, :email, :password, :profile_picture, :logo, :description)
    end
  end

  