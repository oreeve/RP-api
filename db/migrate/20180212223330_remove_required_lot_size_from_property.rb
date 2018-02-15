class RemoveRequiredLotSizeFromProperty < ActiveRecord::Migration[5.1]
  def change
    change_column :properties, :lot_size, :integer, null: true
  end
end
