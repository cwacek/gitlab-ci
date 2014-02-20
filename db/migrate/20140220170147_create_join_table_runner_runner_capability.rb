class CreateJoinTableRunnerRunnerCapability < ActiveRecord::Migration
  def change
    create_join_table :runners, :runner_capabilities do |t|

    end
  end
end
