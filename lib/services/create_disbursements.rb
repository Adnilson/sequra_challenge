module Services
  class CreateDisbursements
    def self.call = new.call

    def call
      Order.where("completed_at >= ? AND disbursed = ?", 7.days.ago, false).find_each do |order|
        Disbursement.create(
          merchant_id: order.merchant_id,
          order_id: order.id,
          amount: DisbursementAmount.new(order.amount).calculate
        )
        order.update(disbursed: true)
      end
    end
  end
end
