class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Cualquier metodo definido aqui esta disponible para todos los controladores
  
  private
  
  def authorize_admin!
    authenticate_user!    # Para asgurarse de que esta sign in, si no lo esta, te lo pide
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
  
end
