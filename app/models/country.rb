class Country < ApplicationRecord
  has_many :own_embassies, dependent: :destroy, class_name: "Embassy", foreign_key: :origin_country_id
  has_many :hosted_embassies, dependent: :destroy, class_name: "Embassy", foreign_key: :destination_country_id
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
end
