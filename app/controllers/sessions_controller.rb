class SessionsController < ApplicationController
  def new
    # Muestra el formulario de inicio de sesión
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "¡Bienvenido!"
    else
      flash.now[:alert] = "Correo o contraseña incorrectos"
      render :new
    end
  end

  def destroy
     session[:user_id] = nil
    redirect_to root_path, notice: "Sesión cerrada"
     end
  end
