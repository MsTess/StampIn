class EmbassiesController < ApplicationController
def index
  if params[:origin_country]
    @embassies = Embassy.where(:origin_country => params[:origin_country])
  else
    false
  end
end

  def show
    @embassy = Embassy.find(params[:id])

    @markers =
    {
      lat: @embassy.latitude,
      lng: @embassy.longitude,
    }
  end
end
