class ResponsesController < ApplicationController

  def create
    @response = Response.new(response_params.merge(responder: current_responder))
    unless @response.save
      flash[:alert] = "Oh noes! I couldn't create your response: #{@response.errors.full_messages.to_sentence}"
    end
    redirect_to questions_path
  end

  private

  def response_params
    params.require(:response).permit(:text, :question_id)
  end

end
