# frozen_string_literal: true

RSpec.describe Project, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_length_of(:title).is_at_most(100) }
  it { is_expected.to validate_length_of(:address).is_at_most(100) }
end
