class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|

    	t.text :text
    	
    	t.references :user
    	t.references :book
      t.timestamps null: false
    end
  end
end
