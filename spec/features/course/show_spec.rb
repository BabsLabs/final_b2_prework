require 'rails_helper'

describe "As a user" do
  describe "when I visit the coruse show page" do
    it "shows the courses name with each student enrolled in the course listed by grade" do
      time_law = Course.create!(name: 'Time Law 101')
      sammy = Student.create!(name: 'Sammy Student')
      sammys_time_law_grade = sammy.student_courses.create!(student_id: sammy.id, course_id: time_law.id, grade: 4.0)
      sally = Student.create!(name: 'Sally Student')
      sallys_time_law_grade = sally.student_courses.create!(student_id: sally.id, course_id: time_law.id, grade: 3.0)
      simon = Student.create!(name: 'Simon Student')
      simons_time_law_grade = simon.student_courses.create!(student_id: simon.id, course_id: time_law.id, grade: 2.0)

      visit "/courses/#{time_law.id}"

      expect(page).to have_content('Time Law 101')
      expect(page).to have_content('Sammy Student')
      expect(page).to have_content('Sally Student')
      expect(page).to have_content('Simon Student')
    end
  end
end

# User Story 2, Course Show Page
# As a user,
# When I visit a course show page,
# Then I see:
# - the course's name
# - each student in the course listed in order from highest grade to lowest grade