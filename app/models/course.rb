class Course < ApplicationRecord
	belongs_to :person, foreign_key: "teacher"
end
