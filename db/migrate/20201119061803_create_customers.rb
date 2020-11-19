class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :mobile
      t.boolean :available

      t.timestamps
    end
  end
end
