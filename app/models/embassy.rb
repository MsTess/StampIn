class Embassy < ApplicationRecord
  has_many :bookmark_embassies
  # belongs_to :country
  # validates :Embassy_Of,
  #           :In_Country,
  #           :In_City,
  #           :Embassy_hijo_h3,
  #           :Embassy_Consulate,
  #           :Address,
  #           :Address_link_GMaps, presence: true
end
