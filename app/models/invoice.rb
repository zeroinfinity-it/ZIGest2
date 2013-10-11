class Invoice < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :oggetto, presence: true
	validates :descrizione, presence: true
	validates :importo, presence: true
end
