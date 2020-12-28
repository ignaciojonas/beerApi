class Style < ApplicationRecord
    validates_presence_of :name, :description
    validates_uniqueness_of :name
end
