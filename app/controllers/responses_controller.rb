class ResponsesController < ApplicationController

  def create
    @response = Response.new(response_params.merge(responder: current_responder))
    if @response.save
      redirect_to questions_path
    else
      flash[:alert] = "Oh noes! I couldn't create your response: #{@response.errors.to_sentence}"
    end
  end

  private

  def response_params
    params.require(:response).permit(:text, :question_id)
  end

end
