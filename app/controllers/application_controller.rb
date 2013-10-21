class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_responder
    Responder.find_or_create_by(cookies.permanent[:responder_id]) do |responder|
      responder.ip_address = request.remote_ip
    end
  end

end
