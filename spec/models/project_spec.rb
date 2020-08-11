require 'rails_helper'
RSpec.describe Project, type: :model do
  context 'Validate Project' do
    let(:user) { User.new(username: 'username') }
    let(:task) { Task.new(task_name: 'task_name', task_hours: '2', task_status: '✅ Done') }
    let(:project) { Project.new(project_name: 'project_name', project_icon: '♦') }

    it 'VALID if has a project name' do
      project.user = user
      project.project_name = 'project_name'
      expect(project).to be_valid
    end

    it 'NOT Valid if has NO project name.' do
      project.project_name = ''
      expect(project).not_to be_valid
    end

    it 'NOT VALID if project has NO user.' do
      project.save
      project.user = nil
      expect(project).not_to be_valid
    end

    it 'VALID if project has user.' do
      project.save
      project.user = user
      expect(project).to be_valid
    end

    context 'Associations for projects' do
      it { should belong_to(:user) }
      it { should have_many(:project_tasks) }
      it { should have_many(:tasks) }
    end

  end
end
