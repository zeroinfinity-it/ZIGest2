class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :oggetto
      t.string :descrizione
      t.float :importo
      t.integer :user_id

      t.timestamps
    end
    add_index :invoices, [:user_id, :created_at]
  end
end
