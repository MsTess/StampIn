require 'rest-client'

class CountriesController < ApplicationController
  def index
    @countries = Country.all
    
    url = "https://api.onlinevisa.com/v1/country/country-combination"
    origin = "LT"
    destination = "AR"
    v_country_serialized = RestClient.get(url, "headers"=> {params: {"origin"=> "#{origin}", "destination"=> "#{destination}"}, 
        "Origin"=> "https://www.onlinevisa.com", 
        "Accept"=> "application/json; charset=utf-8",
        "Host"=> "<calculated when request is sent>",
        "Accept-Encoding"=> "gzip, deflate, br",
        "Connection"=> "keep-alive",
        "Accept"=> "*/*",
        "User-Agent"=> "PostmanRuntime/7.28.2"
        }).read
      v_country = JSON.parse(v_country_serialized)
      puts v_country    
  
  end

  def show
    @country = Country.find(params[:id])
  end
end
