class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|

    	t.string :description
    	t.string :quality
    	t.string :type
    	t.integer :max_price
    	t.integer :min_price

    	t.references :book
    	t.references :user

    	t.timestamps null: false
    end
  end
end
