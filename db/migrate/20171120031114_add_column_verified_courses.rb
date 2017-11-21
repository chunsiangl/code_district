class AddColumnVerifiedCourses < ActiveRecord::Migration[5.1]
  def change
  	add_column :courses, :verified, :boolean, default: false 	
  end
end
