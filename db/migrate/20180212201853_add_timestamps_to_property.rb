class AddTimestampsToProperty < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :created_at, :datetime, null: false
    add_column :properties, :updated_at, :datetime, null: false
    change_column :properties, :address, :hstore, null: false
    change_column :properties, :description, :text, null: false
    change_column :properties, :beds, :integer, null: false
    change_column :properties, :baths, :integer, null: false
    change_column :properties, :home_size, :integer, null: false
    change_column :properties, :lot_size, :integer, null: false
    change_column :properties, :type_of, :string, null: false
    change_column :properties, :status, :string, null: false
  end
end
