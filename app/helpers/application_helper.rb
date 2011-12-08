module ApplicationHelper
  
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ") unless parts.empty?
     end
    end
  end
  
  def admins_only(&block)   # El block es el codigo entre el begin y el end en la vista
   block.call if current_user.try(:admin?)  # Ejecuta el bloque solo si current_user.try(:admin?) es true
   nil
  end
  
end
