class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
    
    	t.string :title
    	t.string :first
    	t.string :last
    	t.integer :isbn

      t.timestamps null: false
    end
  end
end
