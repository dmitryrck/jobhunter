class JobApplication < ApplicationRecord
  belongs_to :company
  belongs_to :contact, required: false

  validates :date_applied, :title, presence: true

  delegate :location, to: :company, allow_nil: true

  scope :active, -> { where(accepting_applications: true, refused: false) }
end
