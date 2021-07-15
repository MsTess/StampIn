class BookmarkEmbassy < ApplicationRecord
  belongs_to :user
  belongs_to :embassy
end
