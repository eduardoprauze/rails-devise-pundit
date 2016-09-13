require 'rails_helper'

RSpec.describe UserLabel, type: :model do
  subject { described_class.new(user_id: 1, label_id: 1) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a label_id" do
    subject.label_id = nil
    expect(subject).to_not be_valid
  end

end
