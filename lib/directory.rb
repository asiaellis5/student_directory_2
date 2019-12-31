require_relative 'student'

class Directory
  attr_reader :directory, :student
  def initialize(student= Student.new("name", "cohort"))
    @student = student
    @directory = []
  end

  def print_header
    "The students of Villains Academy"
  end

  def input_students(student)
      @directory << {"name" => student.name, "cohort" => student.cohort}
  end

  def print_students
    @directory.each do |student|
      puts "#{student["name"]} (#{student["cohort"]} cohort)"
    end
  end

  def student_count
    raise "Error. No Students" if @directory.count == 0
    @directory.count
  end

  def print_footer
    if student_count == 1
      "Overall, we have #{student_count} great student"
    else 
      "Overall, we have #{student_count} great students"
    end
  end

  def print_by_letter
    @directory.each_with_index do |student, index|
      if student["name"][0] == "A"
        puts "#{student["name"]} (#{student["cohort"]} cohort)"
      end
    end
  end

  def print_by_cohort(cohort)
    @directory.each_with_index do |student|
      if student["cohort"] == cohort
        puts "#{student["name"]} (#{student["cohort"]} cohort)"
      end
    end
  end
end
