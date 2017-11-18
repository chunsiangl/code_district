class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.integer :duration
      t.integer :max_student

      t.timestamps
    end
  end
end
