class UpVote < ActiveRecord::Base
  belongs_to :response
  belongs_to :responder
end
