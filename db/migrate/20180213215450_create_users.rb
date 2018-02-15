class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :username,              null: false, default: ""
      t.string :password, null: false, default: ""
      t.boolean :admin

      t.timestamps null: false
    end

    add_index :users, :username,                unique: true
  end
end
