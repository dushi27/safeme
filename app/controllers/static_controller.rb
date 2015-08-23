class StaticController < ApplicationController
  layout "website", :only => :index
  def index
  end
end