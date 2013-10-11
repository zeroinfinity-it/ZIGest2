class CambiaTipoImportoFatture < ActiveRecord::Migration
  def change
  	change_table :invoices do |t|
	  	t.remove :importo
	end

  end
end
