require 'rails_helper'
RSpec.describe 'Signup feature', type: :feature do
  scenario 'Create account with username' do
    visit signup_path
    fill_in 'Username', with: 'Maxy'
    click_button 'Create my account'
    expect(page).to have_content('maxy')
  end

  scenario 'Can not create account if username blank' do
    visit signup_path
    fill_in 'Username', with: ''
    click_button 'Create my account'
    expect(page).to have_content('Sign up')
  end

  scenario 'Can not create account if username already taken' do
    User.create(username: 'johndoe')
    visit signup_path
    fill_in 'Username', with: 'johndoe'
    click_button 'Create my account'
    expect(page). to have_content('Sign up')
  end

end
