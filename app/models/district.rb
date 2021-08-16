class District < ApplicationRecord
  validates :codename, uniqueness: true
end
