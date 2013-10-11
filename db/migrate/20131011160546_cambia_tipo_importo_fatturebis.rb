class CambiaTipoImportoFatturebis < ActiveRecord::Migration
  def change
  	add_column :invoices, :importo, :decimal, precision: 16, scale: 5
  end
end
