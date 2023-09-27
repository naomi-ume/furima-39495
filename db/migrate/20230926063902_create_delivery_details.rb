class CreateDeliveryDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_details do |t|

      t.timestamps
    end
  end
end
