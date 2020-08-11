require 'rails_helper'
RSpec.describe Task, type: :model do
  context 'Validate Task' do
    let(:user) { User.new(username: 'username') }
    let(:task) { Task.new(task_name: 'task_name', task_hours: '2', task_status: '✅ Done') }
    let(:project) { Project.new(project_name: 'project_name', project_icon: '♦') }

    it 'VALID if has a task name' do
      task.user = user
      task.task_name = 'task_name'
      expect(task).to be_valid
    end

    it 'NOT Valid if has NO task name.' do
      task.task_name = ''
      expect(task).not_to be_valid
    end

    it 'NOT VALID if task has NO user.' do
      task.save
      task.user = nil
      expect(task).not_to be_valid
    end

    it 'VALID if task has user.' do
      task.save
      task.user = user
      expect(task).to be_valid
    end

    it 'NOT VALID if task has NO task_status' do
      task.task_status = ''
      expect(task).not_to be_valid
    end

    it 'VALID if task has task status' do
      task.user = user
      task.task_status = '✅ Done'
      expect(task).to be_valid
    end

    it 'NOT VALID if task has no task hours' do
      task.task_hours = nil
      expect(task).not_to be_valid
    end

    it 'VALID if task has task hours' do
      task.user = user
      task.task_hours = 2
      expect(task).to be_valid
    end

    context 'Associations for tasks' do
      it { should belong_to(:user) }
      it { should have_many(:project_tasks) }
      it { should have_many(:projects) }
    end

  end
end
