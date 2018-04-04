class AddNameToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :name, :string, null: false, default: ""
  end
end
