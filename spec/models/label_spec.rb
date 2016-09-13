require 'rails_helper'

RSpec.describe Label, type: :model do
  subject { described_class.new(name: "Test Label", colour: "2") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a colour" do
    subject.colour = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if there is already a label with the same name and colour" do
    Label.create(name: "Test Label", colour: "2")
    expect(subject).to_not be_valid
  end


end
