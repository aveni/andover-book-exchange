class RemoveCourses < ActiveRecord::Migration

	def up
    drop_table :books_courses
    drop_table :courses
	end


	def down
		create_table :courses do |t|
    	t.string :name
    	t.string :teacher
    	t.string :subject

      t.timestamps        
    end
    
    create_join_table :books, :courses do |t|
      t.timestamps        
    end
  end
end
