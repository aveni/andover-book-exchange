class AddLibraryExchangeToListing < ActiveRecord::Migration
  def change
    add_column :listings,  :library_exchange, :boolean, :default => false 
  end
end
