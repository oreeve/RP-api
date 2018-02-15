class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.hstore :address
      t.string :neighborhood
      t.text :description
      t.integer :beds
      t.integer :baths
      t.integer :home_size
      t.integer :lot_size
      t.string :type_of
      t.string :status
    end
  end
end
