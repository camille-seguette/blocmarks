require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:bookmark) { create(:bookmark) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:bookmark) }
end
