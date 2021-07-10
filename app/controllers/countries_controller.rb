require 'rest-client'

class CountriesController < ApplicationController
  def index
    @countries = Country.all
    @visa_result = VisaResult.new
  end

  def show
    @country = Country.find(params[:id])
  end
end
