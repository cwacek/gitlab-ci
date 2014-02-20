class CreateRunnerCapabilities < ActiveRecord::Migration
  def change
    create_table :runner_capabilities do |t|
      t.string :name
      t.integer :version

      t.timestamps
    end
  end
end
