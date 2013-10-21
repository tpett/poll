class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :text
      t.integer :question_id
      t.integer :responder_id

      t.timestamps
    end
    add_foreign_key :responses, :questions
    add_foreign_key :responses, :responders
  end
end
