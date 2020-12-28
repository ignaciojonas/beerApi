require 'rails_helper'

RSpec.describe Beer, :type => :model do
    subject { FactoryBot.build(described_class.to_s.downcase.to_sym) }
  
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    
    it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a rating" do
        subject.rating = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a style"  do
        subject.style = nil
        expect(subject).to_not be_valid
    end
end