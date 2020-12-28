# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Beer, type: :model do
  subject(:beer) { FactoryBot.build(described_class.to_s.downcase.to_sym) }

  it 'is valid with valid attributes' do
    expect(beer).to be_valid
  end

  it 'is not valid without a name' do
    beer.name = nil
    expect(beer).not_to be_valid
  end

  it 'is not valid without a rating' do
    beer.rating = nil
    expect(beer).not_to be_valid
  end

  it 'is not valid without a style' do
    beer.style = nil
    expect(beer).not_to be_valid
  end
end
