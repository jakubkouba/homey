# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :project

  validates :text, :project, presence: true
end
