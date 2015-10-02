class AddLibraryExchangeToListing < ActiveRecord::Migration
  def change
    add_column :listings, :boolean, :library_exchange
  end
end
