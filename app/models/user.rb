class User < ApplicationRecord
  validates_presence_of :name,
                        :email,
                        :api_key

  validates_uniqueness_of :email

  has_many :favorites
end