class Country < ApplicationRecord
  validates :name,
            :alpha2code,
            :capital,
            :timezones,
            :languages,
            :flag,
            :currencies,
            :demonym,
            :latlng,
            :callingCodes, presence: true
end
