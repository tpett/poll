class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_responder

  protected

  def current_responder
    @responder ||= Responder.where(id: cookies.permanent[:responder_id]).first ||
      create_current_responder
  end

  def create_current_responder
    @responder = Responder.create!(ip_address: request.remote_ip)
    cookies.permanent[:responder_id] = @responder.id
    @responder
  end

end
