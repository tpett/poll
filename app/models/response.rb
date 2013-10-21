class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :responder
  has_many :up_votes

  def add_up_vote
    up_votes.create(responder: responder)
  end
end
