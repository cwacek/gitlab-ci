class ChangeScheduleInvertal < ActiveRecord::Migration
  def up
    rename_column :projects, :polling_interval, :polling_interval_string
    add_column :projects, :polling_interval, :integer, null: true

    Project.reset_column_information
    Project.find(:all).each {|project| project.update_attribute(:polling_interval, project.polling_interval_string)}

    remove_column :projects, :polling_interval_string
  end

end
