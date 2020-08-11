require 'rails_helper'
RSpec.describe 'Task feature', type: :feature do
  let(:user) { User.new(username: 'username') }
  let(:task) { Task.new(task_name: 'task_name', task_hours: '2', task_status: '✅ Done') }

  scenario 'Logged in user can create a task.' do
    user.save
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
    visit tasks_path
    click_button 'Add new task'
    fill_in placeholder: 'Enter Task', with: 'task_name'
    fill_in placeholder: 'Hours Worked', with: 2
    click_button 'Create Task'
    expect(page).to have_content('task_name')
  end

  scenario 'Not logged in user shouldnt create a task' do
    user.save
    visit login_path
    fill_in 'Username', with: ''
    click_button 'Log in'
    expect(page).to have_content('Log in')
  end

  scenario 'Can not create task if task name is blank' do
    user.save
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
    visit tasks_path
    click_button 'Add new task'
    fill_in placeholder: 'Enter Task', with: ''
    fill_in placeholder: 'Hours Worked', with: 2
    click_button 'Create Task'
    expect(page).to have_content('Task creation failed')
  end

  scenario 'Can not create task if task hours is blank' do
    user.save
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
    visit tasks_path
    click_button 'Add new task'
    fill_in placeholder: 'Enter Task', with: 'task_name'
    fill_in placeholder: 'Hours Worked', with: ''
    click_button 'Create Task'
    expect(page).to have_content('Task creation failed')
  end
end
