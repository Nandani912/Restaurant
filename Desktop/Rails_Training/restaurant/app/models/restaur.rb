class Restaur < ApplicationRecord
  belongs_to :user
  has_many :menus , dependent: :destroy
end
