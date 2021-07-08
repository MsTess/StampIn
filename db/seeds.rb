# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

# url = "https://restcountries.eu/rest/v2/all"

# Country.destroy_all
# country_serialized = URI.open(url).read
# countries = JSON.parse(country_serialized)
# countries.each {|country|
#     languages = []
#     country["languages"].each {|l|
#     languages << l["name"]}
#     c = Country.create!(
#         name: country["name"],
#         alpha2code: country["alpha2Code"],
#         capital: country["capital"],
#         timezones: country["timezones"],
#         languages: languages.join(", "),
#         flag: country["flag"],
#         currencies: country["currencies"],
#         demonym: country["demonym"],
#         latlng: country["latlng"],
#         callingCodes: country["callingCodes"])
#         puts "Created: #{c.name}"
# }

# countries.each { |country|

  postman_url = "https://onlinevisa.com/page-data/embassies/albania/page-data.json"

  response = RestClient.get(postman_url)
  embassies = JSON.parse
  embassies.each {|embassy|
    emails = []
    embassy["Emails"].each {|em|
      emails << em}
    e = Embassy.create!(
      Embassy_Of: embassy["result"]["data"]["allScrapingCsv"]["edges"]["node"]["Embassy_of"],
      In_Country: embassy["result"]["data"]["allScrapingCsv"]["edges"]["node"]["In_Country"],
      In_City: embassy["result"]["data"]["allScrapingCsv"]["edges"]["node"]["In_City"],
      Embassy_hijo_h3:embassy["result"]["data"]["allScrapingCsv"]["edges"]["node"]["Embassy_Consulate"],
      Embassy_Consulate:embassy["result"]["data"]["allScrapingCsv"]["edges"]["node"]["Embassy_of"],
      Address:embassy["result"]["data"]["allScrapingCsv"]["edges"]["node"]["Address"],
      ddress_link_GMaps:embassy["result"]["data"]["allScrapingCsv"]["edges"]["node"]["Address_link_GMaps"],
      Emails:embassy["result"]["data"]["allScrapingCsv"]["edges"]["node"]["Emails"],
      URL:embassy["result"]["data"]["allScrapingCsv"]["edges"]["node"]["URL"])
    puts "Created embassy of #{e.Embassy_Of} in #{e.In_City}"
    }
