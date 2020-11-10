require 'rails_helper'

RSpec.describe Category, type: :model do
  before { @category = FactoryBot.build(:category) }

  subject { @category }
  it { should respond_to(:name) }
  it { respond_to have_many(:articles) }
  describe 'when  name is not present' do
    before { @category.name = ' ' }
    it { should_not be_valid }
  end
  describe 'when  name is too short' do
    before { @category.name = 'ar' }
    it { should_not be_valid }
  end

end
