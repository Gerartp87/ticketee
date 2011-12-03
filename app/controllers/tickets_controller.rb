class TicketsController < ApplicationController
  
  before_filter :find_project  # Lo hace de cualquier accion
  before_filter :find_ticket, :only => [:show,
                                        :edit,
                                        :update,
                                        :destroy]
  
  def new
    @ticket = @project.tickets.build # build asocia el nuevo objeto ticket con el objeto project
  end                                # foreign key es project_id
  
  
  def create
    @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]  # Te lleva al ticket adecuado dentro del project correspondiente
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
  end
  
  def show
  
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
