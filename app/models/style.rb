# frozen_string_literal: true

class Style < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
