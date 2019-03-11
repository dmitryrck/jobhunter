class JobApplication < ApplicationRecord
  belongs_to :company
  belongs_to :job
  belongs_to :contact, required: false

  validates :date_applied, presence: true

  delegate :location, to: :company, allow_nil: true
end
