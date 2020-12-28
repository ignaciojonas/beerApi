require 'rails_helper'

RSpec.describe Style, :type => :model do
    subject { FactoryBot.build(described_class.to_s.downcase.to_sym) }
  
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    
    it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
        subject.description = nil
        expect(subject).to_not be_valid
    end

    it "is not valid with an existing name"  do
        FactoryBot.create(described_class.to_s.downcase.to_sym, name: subject.name)
        expect(subject).to_not be_valid
    end
end