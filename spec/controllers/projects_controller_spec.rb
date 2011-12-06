require 'spec_helper'

describe ProjectsController do

let(:user) do
  user = Factory(:user)
  user.confirm!
  user
end

let(:project) { Factory(:project) }

context "standard users" do
  { "new" => "get",
    "create" => "post",
    "edit" => "get",
    "update" => "put",
    "destroy" => "delete" }.each do |action, method|
  it "cannot access the new action" do
    sign_in(:user, user)
    get :new
    response.should redirect_to(root_path)
    flash[:alert].should eql("You must be an admin to do that.")
  end
  end
end
  
  # Prueba de que si intentas entrar a la web de un proyecto no existente redirecciona a la web principal
  it "displays an error for a missing project" do
  get :show, :id => "not-here"   # Peticion a la accion show de Projects
  response.should redirect_to(projects_path)  # Se espera que la respuesta nos lleve a la web principal
  message = "The project you were looking for could not be found."
  flash[:alert].should eql(message) # Se espera que se muestre ese mensaje
  end

end
