class AddPinToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :pin, :string
    add_column :projects, :live, :boolean
  end
end
