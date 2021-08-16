class Ward < ApplicationRecord
  validates :codename, uniqueness: true
end
