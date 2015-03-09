require 'spec_helper'

describe Order do
  it "has a valid factory" do
    expect(build(:order)).to be_valid
  end

  # it "is invalid with phone number not as integer value" do
  #   expect(build(:order, phone: "2r34567888" )).to_not be_valid
  # end

  # it "does not allow same number as mobile and phone for order" do
  #   user=create(:user)
  #   expect(build(:order,
  #     user: user,
  #     mobile: 8888888888,
  #     phone: 8888888888)).to_not be_valid
  # end

  # it "allows same number as phone or mobile for two different users" do
  #   FactoryGirl.create(:order,
  #     mobile: 8888888899,
  #     phone: 8888888888)

  #    expect(create(:order,
  #     mobile: 8888888899,
  #     phone: 8888888888)).to be_valid
  # end

end
