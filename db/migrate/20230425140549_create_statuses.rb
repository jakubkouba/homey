class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :title
    end
  end
end
