class AddColumnRequirementsToImages < ActiveRecord::Migration[5.1]
  def change
    change_column :images, :title, :string, null: false
    change_column :images, :url, :string, null: false
  end
end
