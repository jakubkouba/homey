# frozen_string_literal: true

RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:text) }

  it { is_expected.to belong_to(:project) }
end
