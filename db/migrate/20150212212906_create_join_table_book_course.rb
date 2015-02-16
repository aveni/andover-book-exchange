class CreateJoinTableBookCourse < ActiveRecord::Migration
  def change
    create_join_table :books, :courses do |t|
      # t.index [:book_id, :course_id]
      # t.index [:course_id, :book_id]
    end
  end
end
