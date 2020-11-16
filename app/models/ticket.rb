class Ticket < ApplicationRecord
    belongs_to :technician
    belongs_to :end_user
end
