namespace :disbursements do
  desc "create disbursements from the provided seed files"
  task create: [:environment] do
    Order.where('completed_at IS NOT NULL AND disbursed = ?', false).find_each do |order|
      Disbursement.create(
        merchant_id: order.merchant_id,
        order_id: order.id,
        amount: DisbursementAmount.new(order.amount).calculate
      )
    end
  end
end
