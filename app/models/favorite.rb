class Favorite < ApplicationRecord
  validates_presence_of :recipe_title,
                        :recipe_link,
                        :country

  belongs_to :user
end