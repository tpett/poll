class Responder < ActiveRecord::Base
  has_many :responses
  has_many :up_votes

  def can_respond?(response)
    !self.up_votes.any? { |up_vote| up_vote.response == response }
  end
end
