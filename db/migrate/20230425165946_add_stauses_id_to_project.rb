class AddStausesIdToProject < ActiveRecord::Migration[7.0]
  def change
    # we can use this as we use postrgess 11+
    # adding column with the default no longer cause rewrite of the whole table
    add_column :projects, :status_id, :integer, default: Rails.configuration.x.project.default_status_id, null: false
  end
end
