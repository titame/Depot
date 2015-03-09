# require 'spec_helper'

# describe User do
#   it "has a valid factory" do
#     expect(create(:user)).to be_valid
#   end

#   it "is invalid without name" do
#      expect(build(:user, name: nil)).to_not be_valid
#   end

#   it "is invalid without password" do
#      expect(build(:user, password: nil)).to_not be_valid
#   end

#   it "is invalid without age" do
#      expect(build(:user, name: nil)).to_not be_valid
#   end

#   it "is invalid with same name used by 2 different users within a year" do
#      expect(create(:user, name: "Tushar"))
#      expect(build(:user, name: "Tushar")).to_not be_valid
#   end

#   it "is invalid with age within 1 to 17" do
#     expect(build(:user, age: 17)).to_not be_valid
#   end

#   it "is invalid with same email" do
#     expect(create(:user, email: "tushar123@gmail.com"))
#     expect(build(:user, email: "tushar123@gmail.com")).to_not be_valid
#   end

#   it "returns users name with age" do
#     expect(create(:user, name: "tushartitame", age: 22).name_age).to eq "tushartitame:22"
#   end

# end
