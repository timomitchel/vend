class Snack < ApplicationRecord
  has_many :snackvendings
  has_many :machines, through: :snackvendings
end