class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|

    	t.float :price
    	t.references :user
    	t.references :listing

     	t.timestamps null: false
    end
  end
end
