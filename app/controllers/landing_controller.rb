class LandingController < ApplicationController
  def new
    @message = Message.new
  end
  def index
    @message = Message.new
  end
end
