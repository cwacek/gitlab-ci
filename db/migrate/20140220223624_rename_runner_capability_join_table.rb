class RenameRunnerCapabilityJoinTable < ActiveRecord::Migration
  def change
    rename_table   :runner_capabilities, :capabilities
    rename_table   :runner_capabilities_runners, :capabilities_runners
    rename_column  :capabilities_runners, :runner_capability_id, :capability_id
  end
end
