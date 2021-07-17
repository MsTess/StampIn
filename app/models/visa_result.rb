class VisaResult < ApplicationRecord
    has_many :bookmark_visa_results
    belongs_to :origin_country, class_name: "Country"
    belongs_to :destination_country, class_name: "Country"
end
