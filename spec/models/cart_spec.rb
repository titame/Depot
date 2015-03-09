require 'spec_helper'

describe Cart do
  it "has a valid factory" do
    expect(create(:cart)).to be_valid
  end
end
