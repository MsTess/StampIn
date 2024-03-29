require 'json'
require 'open-uri'

# url = "https://restcountries.eu/rest/v2/all"
url = "https://restcountries.com/v3.1/all"

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

  Country.all.each { |country|

    c_lowercase = country.name.downcase.gsub(" ", "-").gsub(/[^\x00-\x7F]/, 'a')


  postman_url = "https://onlinevisa.com/page-data/embassies/#{c_lowercase}/page-data.json"

  # Embassy.destroy_all
  begin
    response = RestClient.get(postman_url)
  rescue RestClient::ExceptionWithResponse => err
    puts "404, #{c_lowercase} embassies not created"
    next
  end
  next if response.blank?
  embassies = JSON.parse(response)
  embassies = embassies["result"]["data"]["allScrapingCsv"]["edges"]
  embassies.each {|embassy|
    # emails = []
    # embassy["Emails"].each {|em|
    #   emails << em}
  own_country = Country.find_by(alpha2code: embassy["node"]["Embassy_of_code_country"])
  host_country = Country.find_by(alpha2code: embassy["node"]["In_Country_code_country"])
  next if own_country.blank? || host_country.blank?
    e = Embassy.create!(
      own_country: own_country,
      host_country: host_country,
      in_city: embassy["node"]["in_City"],
      embassy_hijo_h3:embassy["node"]["Embassy_Consulate"],
      embassy_consulate:embassy["node"]["Embassy_Consulate"],
      address:embassy["node"]["Address"],
      address_link_gmaps:embassy["node"]["Address_link_GMaps"],
      emails:embassy["node"]["Emails"],
      url:embassy["node"]["URLs"])
    puts "Created embassy of #{e.own_country.name} in #{e.in_city}"

  }
}

uk_url = "https://onlinevisa.com/page-data/embassies/united-kingdom/page-data.json"

  # postman_url = "https://onlinevisa.com/page-data/embassies/#{c_lowercase}/page-data.json"


  # Embassy.destroy_all

    response = RestClient.get(uk_url)
  embassies = JSON.parse(response)
  embassies = embassies["result"]["data"]["allScrapingCsv"]["edges"]
  embassies.each {|embassy|
    # emails = []
    # embassy["Emails"].each {|em|
    #   emails << em}
  own_country = Country.find_by(alpha2code: embassy["node"]["Embassy_of_code_country"])
  host_country = Country.find_by(alpha2code: embassy["node"]["In_Country_code_country"])
  next if own_country.blank? || host_country.blank?
    e = Embassy.create!(
      own_country: own_country,
      host_country: host_country,
      in_city: embassy["node"]["in_City"],
      embassy_hijo_h3:embassy["node"]["Embassy_Consulate"],
      embassy_consulate:embassy["node"]["Embassy_Consulate"],
      address:embassy["node"]["Address"],
      address_link_gmaps:embassy["node"]["Address_link_GMaps"],
      emails:embassy["node"]["Emails"],
      url:embassy["node"]["URLs"])
    puts "Created embassy of #{e.own_country.name} in #{e.in_city}"
  }

  usa_url = "https://onlinevisa.com/page-data/embassies/united-states/page-data.json"

  # Embassy.destroy_all

    response = RestClient.get(usa_url)
  embassies = JSON.parse(response)
  embassies = embassies["result"]["data"]["allScrapingCsv"]["edges"]
  embassies.each {|embassy|
    # emails = []
    # embassy["Emails"].each {|em|
    #   emails << em}
  own_country = Country.find_by(alpha2code: embassy["node"]["Embassy_of_code_country"])
  host_country = Country.find_by(alpha2code: embassy["node"]["In_Country_code_country"])
  next if own_country.blank? || host_country.blank?
    e = Embassy.create!(
      own_country: own_country,
      host_country: host_country,
      in_city: embassy["node"]["in_City"],
      embassy_hijo_h3:embassy["node"]["Embassy_Consulate"],
      embassy_consulate:embassy["node"]["Embassy_Consulate"],
      address:embassy["node"]["Address"],
      address_link_gmaps:embassy["node"]["Address_link_GMaps"],
      emails:embassy["node"]["Emails"],
      url:embassy["node"]["URLs"])
    puts "Created embassy of #{e.own_country.name} in #{e.in_city}"

}

  russia_url = "https://onlinevisa.com/page-data/embassies/russia/page-data.json"

  # Embassy.destroy_all

    response = RestClient.get(russia_url)
  embassies = JSON.parse(response)
  embassies = embassies["result"]["data"]["allScrapingCsv"]["edges"]
  embassies.each {|embassy|
    # emails = []
    # embassy["Emails"].each {|em|
    #   emails << em}
  own_country = Country.find_by(alpha2code: embassy["node"]["Embassy_of_code_country"])
  host_country = Country.find_by(alpha2code: embassy["node"]["In_Country_code_country"])
  next if own_country.blank? || host_country.blank?
    e = Embassy.create!(
      own_country: own_country,
      host_country: host_country,
      in_city: embassy["node"]["in_City"],
      embassy_hijo_h3:embassy["node"]["Embassy_Consulate"],
      embassy_consulate:embassy["node"]["Embassy_Consulate"],
      address:embassy["node"]["Address"],
      address_link_gmaps:embassy["node"]["Address_link_GMaps"],
      emails:embassy["node"]["Emails"],
      url:embassy["node"]["URLs"])
    puts "Created embassy of #{e.own_country.name} in #{e.in_city}"

}
