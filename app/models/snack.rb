class Snack < ApplicationRecord
  has_many :snack_vendings
  has_many :machines, through: :snack_vendings
end