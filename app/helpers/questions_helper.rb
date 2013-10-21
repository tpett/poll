module QuestionsHelper

  def order_responses(responses)
    responses.order("text").sort_by { |response| response.up_votes.count }.reverse
  end

end
