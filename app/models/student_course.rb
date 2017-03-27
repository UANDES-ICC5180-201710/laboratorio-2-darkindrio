class StudentCourse < ApplicationRecord
	belongs_to :person, foreign_key: "person_id"
	belongs_to :course, foreign_key: "course_id"
end
