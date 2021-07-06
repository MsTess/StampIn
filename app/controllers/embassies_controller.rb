class EmbassiesController < ApplicationController
  def index
    @embassies = Embassy.all
  end

  def show
    @embassy = Embassy.find(params[:id])
  end
end
