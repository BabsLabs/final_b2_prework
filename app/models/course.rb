class Course < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :students, through: :student_courses

  def grade(student)
    student_courses.find_by(student_id: student.id).grade
  end
end