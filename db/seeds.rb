require 'json'
require 'open-uri'

# url = "https://restcountries.eu/rest/v2/all"

Country.destroy_all
country_serialized = URI.open(url).read
countries = JSON.parse(country_serialized)
countries.each {|country|
    languages = []
    country["languages"].each {|l|
    languages << l["name"]}
    
    currencies = []
    country["currencies"].each {|c|
    currencies << c["name"]}
    
    c = Country.create!(
        name: country["name"],
        alpha2code: country["alpha2Code"],
        capital: country["capital"],
        timezones: country["timezones"],
        languages: languages.join(", "),
        flag: country["flag"],
        currencies: currencies.join(", "),
        demonym: country["demonym"],
        latlng: country["latlng"],
        callingCodes: country["callingCodes"])
        puts "Created: #{c.name}"
}

  postman_url = "https://onlinevisa.com/page-data/embassies/albania/page-data.json"

  Embassy.destroy_all
  response = RestClient.get(postman_url)
  embassies = JSON.parse(response)
  embassies = embassies["result"]["data"]["allScrapingCsv"]["edges"]
  embassies.each {|embassy|
    # emails = []
    # embassy["Emails"].each {|em|
    #   emails << em}
    e = Embassy.create!(
      Embassy_Of: embassy["node"]["Embassy_of"],
      In_Country: embassy["node"]["In_Country"],
      In_City: embassy["node"]["in_City"],
      Embassy_hijo_h3:embassy["node"]["Embassy_Consulate"],
      Embassy_Consulate:embassy["node"]["Embassy_of"],
      Address:embassy["node"]["Address"],
      Address_link_GMaps:embassy["node"]["Address_link_GMaps"],
      Emails:embassy["node"]["Emails"],
      URL:embassy["node"]["URLs"])
    puts "Created embassy of #{e.Embassy_Of} in #{e.In_City}"
    }

