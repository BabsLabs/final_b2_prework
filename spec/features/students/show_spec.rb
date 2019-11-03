require 'rails_helper'

describe "As a user" do
  describe "when I visit a student show page" do
    it "I see the students name, name of each course they are enrolled in, and the grade for each course" do

      hula = Course.create!(name: 'Hula 101')
      time_law = Course.create!(name: 'Time Law 101')

      sammy = Student.create!(name: 'Sammy Student')

      sammys_time_law_grade = sammy.student_courses.create!(student_id: sammy.id, course_id: time_law.id, grade: 4.0)
      sammys_hula_grade = sammy.student_courses.create!(student_id: sammy.id, course_id: hula.id, grade: 3.5)

      visit "/students/#{sammy.id}"

      expect(page).to have_content("Courses for Sammy Student")

      within "#course-#{time_law.id}" do
        expect(page).to have_content("Course Name: Time Law")
        expect(page).to have_content("Grade: 4.0")
      end

      within "#course-#{hula.id}" do
        expect(page).to have_content("Course Name: Hula")
        expect(page).to have_content("Grade: 3.5")
      end

    end
  end
end

# User Story 1, Student Show Page
# As a user,
# When I visit a student show page
# Then I see
# - the student's name
# - the name of each course the student is enrolled in
# - the student's grade for each course