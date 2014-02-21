# == Schema Information
#
# Table name: runners
#
#  id          :integer          not null, primary key
#  token       :string(255)
#  public_key  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#

class Runner < ActiveRecord::Base
  has_many :builds
  has_many :runner_projects, dependent: :destroy
  has_many :projects, through: :runner_projects
  has_and_belongs_to_many :capabilities

  has_one :last_build, ->() { order('id DESC') }, class_name: 'Build'

  attr_accessible :token, :public_key, :description

  before_validation :set_default_values

  def set_default_values
    self.token = SecureRandom.hex(15) if self.token.blank?
  end

  def runnable_projects
    runnable = Project.requirements_by_project.map do |p, req|
      p if req.all? {|r| capabilities.include? r}
    end
    runnable.compact
  end

  def can_run(project)
    return project.requirements.all? {|r| capabilities.include? r}
  end

  def assign_to(project, current_user)
    project.runner_projects.create!(runner_id: self.id)
  end

  def display_name
    return token unless !description.blank?

    description
  end

  def shared?
    runner_projects.blank?
  end
end
