# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :comments

  validates :title, :address, :description, presence: true
  validates :title, :address, length: { maximum: 100 }
end
