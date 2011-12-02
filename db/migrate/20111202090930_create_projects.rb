class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name

      t.timestamps  # Crea dos campos, created_at y updated_at
    end
  end
end
