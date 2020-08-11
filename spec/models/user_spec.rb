require 'rails_helper'
RSpec.describe User, type: :model do
  context 'Validate user' do
    let(:user) { User.new(username: 'username') }
    let(:user2) { User.new(username: 'username2') }

    it 'NOT VALID if username blank!' do
      user.username = ''
      expect(user).not_to be_valid
    end

    it 'VALID if username present!' do
      expect(user).to be_valid
    end

    it 'NOT VALID if username already taken' do
      user2.save
      user.username = 'username2'
      expect(user).not_to be_valid
    end
  end

  context 'Associations for User' do
    let(:user) { User.new(username: 'username') }
    it { should have_many(:tasks) }
    it { should have_many(:projects) }
  end
end
