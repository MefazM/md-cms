class AddClientDescriptionField < ActiveRecord::Migration
  def change
    add_column :spells, :client_description, :string
  end
end
