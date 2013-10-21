class Responder < ActiveRecord::Base
  has_many :responses
  has_many :up_votes

  before_validation :set_cookie_key

  def can_respond?(response)
    !self.up_votes.any? { |up_vote| up_vote.response == response }
  end

  def set_cookie_key
    self.cookie_key ||= SecureRandom.base64
  end
end
