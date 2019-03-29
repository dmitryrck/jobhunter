class Contact < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(:name) }
end
