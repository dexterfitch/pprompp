class ApplicationController < ActionController::Base
  before_action :current_url, only: [:index]

  private

  def current_url
    @uri = request.fullpath
  end
end
