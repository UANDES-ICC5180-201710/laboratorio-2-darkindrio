class CreateStudentCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :student_courses do |t|
      t.integer :person
      t.integer :course

      t.timestamps
    end
  end
end
