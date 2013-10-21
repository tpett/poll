class AddCookieKeyOnResponders < ActiveRecord::Migration
  def change
    add_column :responders, :cookie_key, :string
    Responder.all.each do |responder|
      responder.set_cookie_key
      responder.save!
    end
  end
end
