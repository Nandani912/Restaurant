class Menu < ApplicationRecord
  belongs_to :restaur
  has_many :dishes , dependent: :destroy
end
