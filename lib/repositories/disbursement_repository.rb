module Repositories
  class DisbursementRepository
    def self.all
      Disbursement.all
    end

    def self.create(order)
      Disbursement.create(
        merchant_id: order.merchant_id,
        order_id: order.id,
        amount: DisbursementAmount.new(order.amount).calculate
      )
    end
  end
end
