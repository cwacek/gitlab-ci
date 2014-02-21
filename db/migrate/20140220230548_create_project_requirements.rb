class CreateProjectRequirements < ActiveRecord::Migration
  def change
    create_table :project_requirements do |t|

      t.integer :project_id, null: false
      t.integer :capability_id, null: false

      t.timestamps
    end
  end
end
