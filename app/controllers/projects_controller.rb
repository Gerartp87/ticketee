class ProjectsController < ApplicationController
  
  # Miramos si es admin o no para dejar hacer accion
  before_filter :authorize_admin!, :except => [:index, :show]
  # Indicamos que antes de show, edit, update y destroy se haga find_project
  before_filter :find_project, :only => [:show,
                                         :edit,
                                         :update,
                                         :destroy]
  
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
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash[:alert] = "Project has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to projects_path   # Volvemos a la pagina con todos los proyectos
  end
  
  # Fijarse: los que no tienen vista es porque redirigen de alguna manera al terminar la accion
  
  private
    def find_project
      @project = Project.find(params[:id])
      rescue ActiveRecord::RecordNotFound   # Capturamos la excepcion cuando accedemos a proyecto que no existe
      flash[:alert] = "The project you were looking" +
         " for could not be found."   # Mostramos el mensaje
      redirect_to projects_path       # Y vamos a la web principal
    end
  
end
