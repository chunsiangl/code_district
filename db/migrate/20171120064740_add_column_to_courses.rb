class AddColumnToCourses < ActiveRecord::Migration[5.1]
  def change
  	add_column :courses, :longitude, :float, default: 0
  	add_column :courses, :latitude, :float, default: 0
  	add_column :courses, :venue, :string
  end
end
