class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders do |t|
      t.string :ip_address

      t.timestamps
    end
  end
end
