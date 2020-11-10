require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryBot.build(:user) }

  subject { @user }

  it { should be_valid }
  it { respond_to have_many(:articles) }
  it { respond_to have_many(:votes) }
end
