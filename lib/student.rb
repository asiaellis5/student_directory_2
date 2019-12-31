class Student
    attr_reader :name, :cohort

    def initialize(name, cohort = "November")
        @name = name
        @cohort = cohort
    end

end