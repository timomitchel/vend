class Machine < ApplicationRecord
  belongs_to :owner
  has_many :snack_vendings
  has_many :snacks, through: :snack_vendings

  def average_snack_price
    snacks.average(:price)
  end
end
