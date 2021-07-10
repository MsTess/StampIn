require 'rest-client'

class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def visa_results
    origin_country = Country.find(params[:search][:origin_country])
    destination_country = Country.find(params[:search][:destination_country])
    @vr = VisaResult.find_by(origin_country: origin_country, destination_country: destination_country)
    if @vr.present?
      redirect_to visa_results_display_country_path(@vr)
    else
      url = "https://api.onlinevisa.com/v1/country/country-combination"
      origin = origin_country.alpha2code
      destination = destination_country.alpha2code
      query = {"origin"=> "#{origin}", "destination"=> "#{destination}"}.to_query
      url += "?#{query}"
      v_country_serialized = RestClient.get(url, { 
          "Origin"=> "https://www.onlinevisa.com", 
          "Accept"=> "application/json; charset=utf-8"
      })
        p v_country_serialized
        v_country = JSON.parse(v_country_serialized)
        puts v_country
        c = v_country["countryCombination"]
        @vr = VisaResult.create!(
          visa_modality: c["visaModality"],
          evisa_modality: c["evisaModality"],
          origin_country: origin_country,
          destination_country: destination_country
        )    
        redirect_to visa_results_display_country_path(@vr)
    end
  end

  def visa_results_display
  end

  def show
    @country = Country.find(params[:id])
  end
end
