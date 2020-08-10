require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

student1 = Student.new("Frank")
student2 = Student.new("Jessica")

instructor1 = Instructor.new("Steve")
instructor2 = Instructor.new("Julie")

BoatingTest.new(student1, "Test One", "pending", instructor1)
BoatingTest.new(student1, "Test Two", "pending", instructor1)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line

