class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|

    	t.string :title
    	t.string :author
    	t.integer :isbn
    	t.references :course

    	t.timestamps null: false
    end
  end
end