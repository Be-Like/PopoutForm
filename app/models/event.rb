class Event < ApplicationRecord
  has_many :info_forms, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
