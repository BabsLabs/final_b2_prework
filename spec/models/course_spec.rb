require 'rails_helper'

describe Course, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe "methods" do
    it "shoud be able to calculate a students grade" do  
      time_law = Course.create!(name: 'Time Law 101')
      @sammy = Student.create!(name: 'Sammy Student')
      sammys_time_law_grade = @sammy.student_courses.create!(student_id: @sammy.id, course_id: time_law.id, grade: 4.0)

      expect(time_law.grade(@sammy)).to eq(4.0)
    end
  end

end