class Category < ApplicationRecord

    has_many :products, dependent: :destroy

    has_many :offers 

    validates :name, presence: true, uniqueness: true


end
