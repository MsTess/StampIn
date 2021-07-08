# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = "https://restcountries.eu/rest/v2/all"

Country.destroy_all
country_serialized = URI.open(url).read
countries = JSON.parse(country_serialized)
countries.each {|country|
    languages = []
    country["languages"].each {|l|
    languages << l["name"]}
    c = Country.create!(
        name: country["name"],
        alpha2code: country["alpha2Code"],
        capital: country["capital"],
        timezones: country["timezones"],
        languages: languages.join(", "),
        flag: country["flag"],
        currencies: country["currencies"],
        demonym: country["demonym"],
        latlng: country["latlng"],
        callingCodes: country["callingCodes"])
        puts "Created: #{c.name}"
}