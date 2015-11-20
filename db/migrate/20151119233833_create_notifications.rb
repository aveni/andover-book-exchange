class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
    	t.text :message, null:false
    	t.boolean :show, default:true

    	t.timestamps null: false
    end
  end
end
