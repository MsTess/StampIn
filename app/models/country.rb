class Country < ApplicationRecord
  has_many :own_embassies, dependent: :destroy, class_name: "Embassy", foreign_key: :own_country_id
  has_many :hosted_embassies, dependent: :destroy, class_name: "Embassy", foreign_key: :host_country_id
  #validates :name,
  #          :alpha2code,
  #          :capital,
  #          :timezones,
  #          :languages,
  #          :flag,
  #          :currencies,
  #          :demonym,
  #          :latlng,
  #          :callingCodes, presence: true

    def background_image
    pixabay_api_key = '21611264-538b8cdc7adae5ce01738c67b'
    name = @country.name
    url = "https://pixabay.com/api/?key=#{pixabay_api_key}&q=#{name}&image_type=photo&pretty=true"
    parsed_response = JSON.parse(RestClient.get(url))
    parsed_response["hits"].present? ? parsed_response["hits"][0]["largeImageURL"] : ActionController::Base.helpers.asset_path("anton-8eG73NjiHao-unsplash.jpg")
  end
end
