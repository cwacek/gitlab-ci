class Capability < ActiveRecord::Base
  has_and_belongs_to_many :runners
  has_many :projects, through: :project_requirements

  attr_accessible :name, :version, :description

  validates_presence_of :name, :version, :description
  validates_uniqueness_of :name
end
