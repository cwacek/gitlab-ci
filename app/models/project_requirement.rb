class ProjectRequirement < ActiveRecord::Base
  attr_accessible :project_id, :capability_id

  belongs_to :project
  belongs_to :capability

  validates_uniqueness_of :project_id, scope: :capability_id
end
