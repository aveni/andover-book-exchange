class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|

    	t.string :type
    	t.integer :price

    	t.references :user
    	t.references :listing

     	t.timestamps null: false
    end
  end
end
