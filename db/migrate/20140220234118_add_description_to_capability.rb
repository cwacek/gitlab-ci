class AddDescriptionToCapability < ActiveRecord::Migration
  def change
    add_column :capabilities, :description, :string
  end
end
