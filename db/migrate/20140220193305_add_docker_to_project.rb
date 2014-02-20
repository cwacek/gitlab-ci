class AddDockerToProject < ActiveRecord::Migration
  def change
    add_column :projects, :use_docker, :boolean
  end
end
