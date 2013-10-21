class UpVotesController < ApplicationController

  before_action :set_response

  def create
    @response.up_votes.create(responder: current_responder)
    redirect_to questions_path
  end

  private

  def set_response
    @response ||= Response.find(params[:response_id])
  end

end
