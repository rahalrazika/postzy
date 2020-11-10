require 'rails_helper'

RSpec.describe Category, type: :model do
  before { @category = FactoryBot.build(:category) }

  subject { @category }
  it { should respond_to(:name) }
  it { respond_to have_many(:articles) }
end
