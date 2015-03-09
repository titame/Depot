require 'spec_helper'

describe LineItem do
  it "has valid factory" do
    expect(create(:line_item)).to be_valid
  end
end
