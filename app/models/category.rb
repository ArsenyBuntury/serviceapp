class Category < ApplicationRecord
    has_many :order_categories, dependent: :destroy
    has_many :orders, through: :order_categories
end
