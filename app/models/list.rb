class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks


  validates :name, length: {minimum: 1}, uniqueness: true
end
