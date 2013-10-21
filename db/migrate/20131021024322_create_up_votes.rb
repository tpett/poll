class CreateUpVotes < ActiveRecord::Migration
  def change
    create_table :up_votes do |t|
      t.integer :response_id
      t.integer :responder_id

      t.timestamps
    end
    add_foreign_key :up_votes, :responses
    add_foreign_key :up_votes, :responders
  end
end
