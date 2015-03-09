require 'spec_helper'

describe Product do
  it "has a valid factory" do
    expect(create(:product)).to be_valid
  end
  it "is invalid without title" do
     expect(build(:product, title: nil)).to_not be_valid
  end

end
