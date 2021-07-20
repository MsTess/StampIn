require 'rest-client'

class CountriesController < ApplicationController
  # before_action :set_image, only: [:show]
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

  private

  def set_image
    @image = @country.background_image
  end
end
