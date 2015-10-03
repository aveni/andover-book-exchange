class AddPickedUpToExchange < ActiveRecord::Migration
  def change
    add_column :exchanges, :picked_up, :boolean, :default => false
  end
end
