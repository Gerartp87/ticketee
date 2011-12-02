class ProjectsController < ApplicationController
  
  def index
    
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    @project.save   # Guardamos el project en la base de datos
    flash[:notice] = "Project has been created."  # Pasar mensaje a la siguiente peticion
    redirect_to @project  # Esto redigiria al show del project
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
end
