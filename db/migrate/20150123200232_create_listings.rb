class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|

    	t.text :description
    	t.string :quality
    	t.string :type
    	t.float :max_price
    	t.float :min_price

    	t.references :book
    	t.references :user

    	t.timestamps null: false
    end
  end
end
