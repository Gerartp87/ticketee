class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all   # Sacamos todos de la base de datos
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save   # Si se ha metido campo name deja meter en la base de datos
      flash[:notice] = "Project has been created."
      redirect_to @project
    else  # Si no se ha metido campo name
      flash[:alert] = "Project has not been created."
      render :action => "new"
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
end
