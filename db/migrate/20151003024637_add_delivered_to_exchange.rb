class AddDeliveredToExchange < ActiveRecord::Migration
	def change
		add_column :exchanges, :delivered, :boolean, :default => false
		add_column :exchanges, :library_exchange, :boolean, :default => false
	end
end
