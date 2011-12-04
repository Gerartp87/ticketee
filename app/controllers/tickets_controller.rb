class TicketsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_project  # Lo hace de cualquier accion
  before_filter :find_ticket, :only => [:show,
                                        :edit,
                                        :update,
                                        :destroy]
  
  def new
    @ticket = @project.tickets.build # build asocia el nuevo objeto ticket con el objeto project
  end                                # foreign key es project_id
  
  
  def create
    @ticket = @project.tickets.build(params[:ticket].merge!(:user => current_user))
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]  # Te lleva al ticket adecuado dentro del project correspondiente
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
  end
  
  # las funciones del private ya hacen todo lo que hay que hacer
  def show
  end
  
  def edit
  end
  
  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."
    redirect_to @project
  end
  
  
  # Se usa project_id en lugar de id solo para diferenciar de cuando buscamos el id de un ticket que sera solo id
  private
    def find_project
      @project = Project.find(params[:project_id])
    end
    
    def find_ticket
      @ticket = @project.tickets.find(params[:id])
    end
   
end
