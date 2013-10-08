class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.string :cognome
      t.integer :eta
      t.string :email

      t.timestamps
    end
  end
end
