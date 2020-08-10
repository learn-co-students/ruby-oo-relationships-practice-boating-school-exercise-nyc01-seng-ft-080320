class Instructor

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def boating_tests
        BoatingTest.all.select {|bt| bt.instructor == self}
    end

    def all_students
        self.boating_tests.map {|bt| bt.student}.uniq
    end

    def passed_students
        passed_bts = self.boating_tests.find_all {|bt| bt.test_status == "pass"}
        passed_bts.map {|bt| bt.student}
    end

    def pass_student(student, test_name)
        test = self.boating_tests.find {|bt| bt.student == student && bt.test_name == test_name}
        if test
            test.test_status = "pass"
        else
            BoatingTest.new(student, test_name, "pass", self)
        end
        test
    end

    def fail_student(student, test_name)
        test = self.boating_tests.find {|bt| bt.student == student && bt.test_name == test_name}
        if test
            test.test_status = "fail"
        else
            BoatingTest.new(student, test_name, "fail", self)
        end
        test
    end



end
