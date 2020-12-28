# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Style, type: :model do
  subject(:style) { FactoryBot.build(described_class.to_s.downcase.to_sym) }

  it 'is valid with valid attributes' do
    expect(style).to be_valid
  end

  it 'is not valid without a name' do
    style.name = nil
    expect(style).not_to be_valid
  end

  it 'is not valid without a description' do
    style.description = nil
    expect(style).not_to be_valid
  end

  it 'is not valid with an existing name' do
    FactoryBot.create(described_class.to_s.downcase.to_sym, name: style.name)
    expect(style).not_to be_valid
  end
end
