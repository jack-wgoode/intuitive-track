class EndUser < ApplicationRecord
    has_many :tickets
    has_many :technicians, through: :tickets
end
