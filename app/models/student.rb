class Student

    attr_accessor :first_name
    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def boating_tests
        BoatingTest.all.select {|bt| bt.student == self}
    end

    def all_instructors
        self.boating_tests.map {|bt| bt.instructor}.uniq
    end

    def self.find_student(first_name)
        self.all.find {|student| student.first_name == first_name}
    end

    def grade_percentage
        passes = self.boating_tests.select {|bt| bt.test_status == "pass"}
        fails = self.boating_tests.select {|bt| bt.test_status == "fail"}
        passes / (fails + passes)
    end

end
