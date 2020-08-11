require 'rails_helper'
RSpec.describe 'Project feature', type: :feature do
  let(:user) { User.new(username: 'username') }
  let(:task) { Task.new(task_name: 'task_name', task_hours: '2', task_status: '✅ Done') }
  let(:project) { Project.new(project_name: 'project_name', project_icon: '♦') }

  scenario 'Logged in User can create project' do
    user.save
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
    visit projects_path
    click_button 'Add new project'
    fill_in 'Project name', with: 'project_name'
    click_button 'Create Project'
    expect(page).to have_content('Project created')
  end

  scenario 'Not logged in user should not create a project' do
    user.save
    visit login_path
    fill_in 'Username', with: ''
    click_button 'Log in'
    expect(page).to have_content('Log in')
  end

  scenario 'Can not create project if project name is blank' do
    user.save
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
    visit projects_path
    click_button 'Add new project'
    fill_in 'Project name', with: ''
    click_button 'Create Project'
    expect(page).to have_content('Project creation failed!')
  end


end
