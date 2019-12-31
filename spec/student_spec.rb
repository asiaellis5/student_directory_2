require 'student'
describe Student do
    let(:student){Student.new("Asia")}
    let(:student2){Student.new("Asia", "December")}
   
    describe "initialization" do
      it "allows name to be set" do
        expect(student.name).to eq "Asia"
      end

     it "has a default cohort value of November" do
       expect(student.cohort).to eq "November"
     end

     it "allows the cohort to be overwritten" do
       expect(student2.cohort).to eq "December"
     end
   end
end