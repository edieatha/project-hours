require 'rails_helper'
RSpec.describe 'Login feature', type: :feature do
  let(:user) { User.new(username: 'johndoe') }
  scenario 'Valid login' do
    user.save
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
    expect(page).to have_content('All my tasks')
  end

  scenario 'Invalid login' do
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
    expect(page).to have_content('Log in')
  end
end