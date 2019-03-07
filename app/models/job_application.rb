class JobApplication < ApplicationRecord
  belongs_to :company
  belongs_to :job
  belongs_to :contact
end
