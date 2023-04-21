class Project < ApplicationRecord
  validates :title, :address, :description, presence: true
end
