class UpVote < ActiveRecord::Base
  belongs_to :response
  belongs_to :responder

  validates_uniqueness_of :response_id, scope: :responder_id
end
