class EmbassiesController < ApplicationController
def index
  @countries = Country.all
  # raise
    @embassies = Embassy.where(origin_country: params[:query][:origin_country]) if params[:query][:origin_country]
    p '================', @embassies
end

  def show
    @embassy = Embassy.find(params[:id])
    @user = current_user
    @embassy_bookmark = BookmarkEmbassy.new
    p @embassy.latitude
    p @embassy.longitude

    @markers =
    {
      lat: @embassy.latitude,
      lng: @embassy.longitude
    }
  end
end
