require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  subject(:user) { build(:user) }

  it "creates a password digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end

  describe 'associations' do
    it { should have_many(:goals) }
  end

  describe 'instance methods' do
    describe "#is_password?" do
      context 'when valid password' do
        it 'should return true' do
          expect(user.is_password?('password')).to be true
        end
      end

      context 'when invalid password' do
        it 'should return false' do
          expect(user.is_password?('tunafishincorrectpassword')).to be false
        end
      end

    end

    describe "#ensure_session_token" do
      it 'should be called after user initialization' do
        expect(user.session_token).to_not be nil
      end
    end

    describe "#reset_session_token!" do

      it 'sets a new session token on the user' do
        old_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).to_not eq(old_token)
      end
      it 'returns the new session token' do
        expect(user.reset_session_token!).to_not be nil
      end
    end
  end

  describe 'class methods' do

    describe "User::find_by_credentials" do



      context "with valid credentials" do
        it "should return the user object" do
          user = User.create(email: "SHELLY@shellysseashellsite.me", password: 'password')
          expect(User.find_by_credentials(user.email, user.password)).to_not be nil
        end
      end

      context "with invalid credentials" do
        it "should return nil" do
          expect(User.find_by_credentials(user.email, 'smellytunafish')).to be nil
        end
      end
    end
  end

end
