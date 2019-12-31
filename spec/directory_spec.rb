require 'directory'
require 'student'

describe Directory do
    let(:subject){ described_class.new} 
    let(:student){ Student.new("Asia", "November") }
    let(:student2){ Student.new("Ruby", "December") }
    let(:expected_output) { ("Asia (November cohort)")}

    describe "#initialization" do
      it "defaults with an empty array" do
        expect(subject.directory).to be_empty
      end

      it "loads a student if given one" do
          expect(described_class.new(student).student).to eq student
      end
    end

    describe "#print_header" do
      it "prints the header" do
        expect(subject.print_header).to eq "The students of Villains Academy"
      end
    end

    describe "#input_students" do
      it "adds a student to the array" do
        expect(subject.input_students(student)).to be_a(Array)
      end

      it "allows adding a new student" do
        subject.input_students(student)
        expect(subject.directory).to eq [{"name" => "Asia", "cohort" => "November"}]
       end
    end

    describe "#print_student" do
      it "prints the students" do
        subject.input_students(student)
        expect{subject.print_students}.to output{"Asia (November cohort)"}.to_stdout
      end
    end

    describe "#print_by_letter" do
      it "prints by first letter of name" do
        subject.input_students(student)
        subject.input_students(student2)
        expect{subject.print_by_letter}.to output{"Asia (November cohort)"}.to_stdout
      end
    end

    describe "#print_by_cohort" do
        it "prints by cohort" do
            subject.input_students(student)
            subject.input_students(student2)
            expect{subject.print_by_cohort("November")}.to output{"Asia (November cohort)"}.to_stdout
        end
    end

    describe "#student_count" do
      it "counts the number of students" do
        subject.input_students(student)
        subject.input_students(student2)
        expect(subject.student_count).to eq 2
      end

      it "raises an error if there are no students" do
        expect{subject.student_count}.to raise_error "Error. No Students"
      end
    end

    describe "#print_footer" do
      it "prints a footer at the end for more than one student" do
        subject.input_students(student)
        subject.input_students(student2)
        expect(subject.print_footer).to eq "Overall, we have 2 great students"
      end

      it "prints a footer for 1 student" do
          subject.input_students(student)
          expect(subject.print_footer).to eq "Overall, we have 1 great student"
      end
    end
end