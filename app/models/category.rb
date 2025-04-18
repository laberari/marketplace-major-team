class Category < ApplicationRecord

    has_many :products, dependent: :destroy

    has_many :product_offers 

    has_many :offers 

    validates :name, presence: true, uniqueness: true


end
