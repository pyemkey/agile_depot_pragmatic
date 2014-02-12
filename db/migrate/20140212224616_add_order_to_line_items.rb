class AddOrderToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :order_id, index: true
  end
end
