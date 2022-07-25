class Order < ApplicationRecord
    has_many :order_services, dependent: :destroy
    has_many :services, through: :order_services

    has_many :order_staffs, dependent: :destroy
    has_many :staffs, through: :order_staffs

    has_many :order_categories, dependent: :destroy
    has_many :categories, through: :order_categories

    validates :name, presence: true
    validates :date, presence: true
end
