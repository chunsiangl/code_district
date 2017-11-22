class RemoveDurationInCourses < ActiveRecord::Migration[5.1]
  def change
  	remove_column :courses, :duration
  end
end
