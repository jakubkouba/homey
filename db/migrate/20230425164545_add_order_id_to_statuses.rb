class AddOrderIdToStatuses < ActiveRecord::Migration[7.0]
  def change
    add_column :statuses, :order_id, :integer
  end
end
