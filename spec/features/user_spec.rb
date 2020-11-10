require 'rails_helper'

RSpec.describe User, type: :features do
  before :each do
    @user = User.new(name: 'raza', email: 'raza@raza.com',
                     password: '1234567', password_confirmation: '1234567')
  end

  subject { @user }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }

  describe 'when  name is not present' do
    before { @user.name = ' ' }
    it { should_not be_valid }
  end
  describe 'when email is not present' do
    before { @user.email = ' ' }
    it { should_not be_valid }
  end
  describe 'when  password is not present' do
    before { @user.password = ' ' }
    it { should_not be_valid }
  end
  describe 'when  password_confirmation is not present' do
    before { @user.password_confirmation = ' ' }
    it { should_not be_valid }
  end

  describe 'when  name is short then 3 characters' do
    before { @user.name = 'az' }
    it { should_not be_valid }
  end
  describe 'when a name is too long' do
    before { @user.name = 'a' * 24 }
    it { should_not be_valid }
  end
  describe 'when  password is less then 6 characters' do
    before { @user.password = '12345' }
    it { should_not be_valid }
  end
  describe 'when email adresse is taken ' do
    before do
      same_user_email = @user.dup
      same_user_email.save
    end
    it { should_not be_valid }
  end

  describe 'when name is taken ' do
    before do
      same_user_name = @user.dup
      same_user_name.save
    end
    it { should_not be_valid }
  end
end
