class Embassy < ApplicationRecord
  belongs_to :origin_country, class_name: "Country"
  belongs_to :destination_country, class_name: "Country"

  # belongs_to :country
  # validates :Embassy_Of,
  #           :In_Country,
  #           :In_City,
  #           :Embassy_hijo_h3,
  #           :Embassy_Consulate,
  #           :Address,
  #           :Address_link_GMaps, presence: true
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

end
