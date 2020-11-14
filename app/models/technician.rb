class Technician < ApplicationRecord
    has_many :tickets
    has_many :end_users, through: :tickets
end
