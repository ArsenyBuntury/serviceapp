class Staff < ApplicationRecord
    has_many :order_staffs, dependent: :destroy
    has_many :orders, through: :order_staffs
end
