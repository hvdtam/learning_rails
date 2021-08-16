class Province < ApplicationRecord
  validates :codename, uniqueness: true
  searchkick
end
