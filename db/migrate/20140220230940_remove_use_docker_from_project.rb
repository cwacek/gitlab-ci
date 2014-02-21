class RemoveUseDockerFromProject < ActiveRecord::Migration
  def up
    remove_column :projects, :use_docker
  end
end
