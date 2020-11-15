require 'rails_helper'
RSpec.describe :Vote, type: :model do
  before :each do
    @vote = Vote.new(author_id: '1', article_id: '3')
  end

  subject { @vote }

  it { should belong_to(:author) }
  it { should belong_to(:article) }
end
