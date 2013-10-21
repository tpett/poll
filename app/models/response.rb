class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :responder
  has_many :up_votes
end
