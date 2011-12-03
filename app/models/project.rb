class Project < ActiveRecord::Base
  
    validates :name, :presence => true  # Validamos que se ha introducido campo name. 
                                        # Generalmente lo hace antes de meter en la base de datos. Si no
                                        # hay name no lo mete.
end
