require 'rails_helper'

RSpec.describe Article, type: :model do
  before { @article = FactoryBot.build(:article) }

  subject { @article }
  it { should respond_to(:title) }
  it { should respond_to(:author_id) }
  it { should respond_to(:content) }

  describe 'when user is not present' do
    before { @article.author_id = nil }
    it { should_not be_valid }
  end
  describe 'content is too long' do
    before { @article.content = 'lorem' * 1200 }
    it { should_not be_valid }
  end

  describe 'content is not present' do
    before { @article.content = ' ' }
    it { should_not be_valid }
  end
  describe 'title is too long' do
    before { @article.title = 'lorem' * 30 }
    it { should_not be_valid }
  end

  describe 'content is not present' do
    before { @article.title = ' ' }
    it { should_not be_valid }
  end

  describe 'article associations' do
    it { should belong_to(:author) }
    it { should have_many(:categories) }
    it { should have_many(:votes) }
  end
end
