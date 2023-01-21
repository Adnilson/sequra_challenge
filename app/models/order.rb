class Order < ApplicationRecord
  belongs_to :merchants
  belongs_to :shoppers

  has_one :disbursement
end
