class Country < ApplicationRecord
  has_many :users
  has_many :embassys
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
