class Machine < ApplicationRecord
  belongs_to :owner
  has_many :snackvendings
  has_many :snacks, through: :snackvendings
end
