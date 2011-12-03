require 'spec_helper'

describe ProjectsController do
  
  # Prueba de que si intentas entrar a la web de un proyecto no existente redirecciona a la web principal
  it "displays an error for a missing project" do
  get :show, :id => "not-here"   # Peticion a la accion show de Projects
  response.should redirect_to(projects_path)  # Se espera que la respuesta nos lleve a la web principal
  message = "The project you were looking for could not be found."
  flash[:alert].should eql(message) # Se espera que se muestre ese mensaje
  end

end
