class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :public_view?, :current_entry, :current_container

  layout Proc.new { |c| public_view? ? "public/#{current_container.layout}" : "application" }


  # helper methods
  def public_view?
    request.env["public"]
  end

  def current_entry
    request.env["current_entry"]
  end

  def current_container
    request.env["current_container"]
  end
end
