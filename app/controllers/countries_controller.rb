require 'rest-client'

class CountriesController < ApplicationController
  def index
    @countries = Country.all
    @visa_result = VisaResult.new
  end

  def show
    @country = Country.find(params[:id])
    lat = @country.latlng[1..4]
    lng = @country.latlng[6..10]
    @markers =
      {
        lat: lat,
        lng: lng,
        info_window: render_to_string(partial: "info_window", locals: { country: @country.name })
      }
  end
end
