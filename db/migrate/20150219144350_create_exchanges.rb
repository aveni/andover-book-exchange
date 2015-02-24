class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|

    	t.references :user
    	t.references :listing
      	t.timestamps null: false
    end
  end
end
