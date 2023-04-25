# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :comments # rubocop:disable Rails/HasManyOrHasOneDependent
  belongs_to :status

  validates :title, :address, :description, presence: true
  validates :title, :address, length: { maximum: 100 }
end
